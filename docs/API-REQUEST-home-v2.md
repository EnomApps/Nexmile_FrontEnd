# API request — Home screen v2 (banners, categories, filters)

For the backend team. This is everything the customer app needs to build the
Zomato-style home screen: a banner carousel, a cuisine rail, filter and sort
sheets, and richer restaurant cards.

Nothing here changes an existing response in a breaking way — every item is
either a **new endpoint**, a **new field on an existing resource**, or a **new
optional query parameter**.

Ordered by how much it blocks us. Items 1–3 block the whole screen.

---

## 1. Restaurant rating — the biggest gap

**Nothing in the API exposes a rating today.** The screens lean on it heavily:
the green `4.0` badge on every card, and "Rated 3.5+ / 4.0+" in the filter
sheet. There is also no way for a customer to leave one.

**Add to the restaurant resource:**

```json
"rating": 4.0,
"rating_count": 1284
```

`rating` should be null (not `0`) for a restaurant with too few ratings to
show — the app will hide the badge rather than display "0.0", which reads as
"bad" instead of "new".

**And a way to create them.** Suggested:

```
POST /v1/orders/{id}/review     { "rating": 4, "comment": "..." }
GET  /v1/orders/{id}/review
```

Only on a `delivered` order, one per order.

> **Decision needed from you:** if ratings are not planned for this release,
> tell us now. We will design the cards without the badge rather than leaving a
> gap that has to be redesigned later.

---

## 2. `GET /v1/home` — one composite call

Zomato and Swiggy both build the home screen from a single endpoint that
returns *ordered sections*. It matters because **it lets you re-order, add or
remove a home section from the server without an app release**. If we hard-code
the order in the app, every change is a Play Store submission and a week.

```
GET /v1/home?address_id=1
GET /v1/home?latitude=13.03&longitude=80.10
```

```json
{
  "data": {
    "sections": [
      {
        "type": "banners",
        "items": [
          {
            "id": 1,
            "image_url": "https://…/banner.jpg",
            "alt_text": "Items at 50% off",
            "action": { "type": "collection", "value": "items-under-99" },
            "starts_at": "2026-08-28T00:00:00Z",
            "ends_at": "2026-09-04T00:00:00Z"
          }
        ]
      },
      {
        "type": "cuisines",
        "items": [
          { "slug": "biryani", "name": "Biryani", "image_url": "https://…/biryani.png" },
          { "slug": "cake",    "name": "Cake",    "image_url": "https://…/cake.png" }
        ]
      },
      {
        "type": "collection_tile",
        "title": "Meals under ₹250",
        "slug": "under-250",
        "image_url": "https://…/tile.png"
      },
      {
        "type": "restaurants",
        "title": "Recommended for you",
        "layout": "grid",
        "items": [ /* restaurant resource, same shape as GET /v1/restaurants */ ]
      },
      {
        "type": "restaurants",
        "title": "Featured",
        "layout": "list",
        "items": [ /* … */ ]
      }
    ]
  }
}
```

**Rules we will follow:** a `type` the app does not recognise is skipped
silently, so you can ship a new section type before we support it. `title` is
**already localised by the server** using the customer's `preferred_locale`,
the same way `status_label` works on orders today.

**Banner `action`** tells the app where a tap goes. Supported values:
`{"type":"restaurant","value":"<id>"}`, `{"type":"collection","value":"<slug>"}`,
`{"type":"cuisine","value":"<slug>"}`, `{"type":"url","value":"https://…"}`,
`{"type":"none"}`.

If a composite endpoint is too much for this release, the fallback is separate
`GET /v1/banners`, `GET /v1/cuisines` and `GET /v1/collections` — we can work
with that, but we lose server-side ordering.

---

## 3. New fields on the restaurant resource

Used by the cards and by the filters. All on the existing resource returned by
`GET /v1/restaurants`, `GET /v1/restaurants/{id}` and inside `/v1/home`.

| Field | Type | Used for |
|---|---|---|
| `rating` | `number \| null` | Green badge on the card |
| `rating_count` | `int` | "1.2K+ ratings" |
| `is_pure_veg` | `bool` | The VEG toggle in the header |
| `cost_for_two` | `int \| null` | Dish-price filter, "₹300 for two" |
| `cuisines` | `string[]` | Cuisine rail filtering, card subtitle |
| `offers` | `Offer[]` | The ribbon on the card image |
| `has_free_delivery` | `bool` | "Free delivery" filter and ribbon |
| `is_favourite` | `bool` | The bookmark icon state |

**`Offer`** — the app renders `label` verbatim, so the wording stays yours:

```json
"offers": [
  { "label": "₹100 OFF above ₹499", "type": "flat" },
  { "label": "Items starting at ₹129", "type": "price_point" }
]
```

Only the **first** offer is shown on a card. Order them by what you want
promoted.

---

## 4. New query parameters on `GET /v1/restaurants`

All optional. Absent means "no filter", exactly as today.

| Parameter | Values | Notes |
|---|---|---|
| `sort` | `relevance` (default), `rating`, `delivery_time`, `cost_low_high`, `cost_high_low` | The "Sort by" row |
| `cuisine` | slug, repeatable — `?cuisine=biryani&cuisine=pizza` | Cuisine rail + sheet |
| `rating_min` | `3.5`, `4.0` | "Rated 3.5+ / 4.0+" |
| `cost_min` / `cost_max` | integer rupees | Dish-price brackets |
| `veg_only` | `1` | The VEG toggle |
| `free_delivery` | `1` | Filter chip |
| `no_packaging_fee` | `1` | "No packaging charges" chip |
| `near_and_fast` | `1` | The lightning chip. **Define this server-side** — we should not invent a distance/time rule the backend disagrees with |
| `has_offers` | `1` | "Buy 1 Get 1 and more" / "Deals of the day" |
| `open_now` | `1` | Hide shut restaurants |

**Please also return, alongside `data`:**

```json
"meta": {
  "total": 42,
  "applied_filters": { "cuisine": ["biryani"], "rating_min": 4.0 }
}
```

`total` drives the "Show results (42)" button in the filter sheet — without it
we cannot show a count until after the sheet closes, which is the whole point
of that button.

---

## 5. `GET /v1/filters` — filter definitions from the server

So a new filter can be added without an app release, the same argument as §2.

```json
{
  "data": [
    {
      "key": "rating_min",
      "title": "Restaurant Rating",
      "type": "single_choice",
      "options": [
        { "value": "3.5", "label": "Rated 3.5+" },
        { "value": "4.0", "label": "Rated 4.0+" }
      ]
    },
    {
      "key": "cost_for_two",
      "title": "Dish Price",
      "type": "range_choice",
      "options": [
        { "value": "0-150",  "label": "Less than ₹150" },
        { "value": "150-300","label": "₹150 – ₹300" },
        { "value": "300-",   "label": "₹300+" }
      ]
    }
  ]
}
```

`title` and `label` localised server-side. Types we will support:
`single_choice`, `multi_choice`, `range_choice`, `toggle`.

If this is too much, we will hard-code the filter list and only §4 matters.

---

## 6. `GET /v1/collections/{slug}` — curated lists

Powers the "Meals under ₹250" tile and any banner pointing at a collection.

```
GET /v1/collections/under-250?address_id=1
```

```json
{
  "data": {
    "slug": "under-250",
    "title": "Meals under ₹250",
    "subtitle": "Full meals, nothing over ₹250",
    "banner_url": "https://…/header.jpg",
    "restaurants": [ /* restaurant resource */ ]
  }
}
```

---

## 7. Favourites

The bookmark icon on the Featured cards.

```
GET    /v1/favourites                        → list of restaurants
POST   /v1/restaurants/{id}/favourite        → 200
DELETE /v1/restaurants/{id}/favourite        → 200
```

Plus `is_favourite` on the restaurant resource (§3), so the list does not need
a second call to know which hearts are filled.

---

## 8. Dish-level search (lower priority)

The search bar says *"Restaurant name or a dish"*. Today `?search=` matches
restaurants only. Either:

- extend `?search=` to match dish names and return the restaurants serving them
  (simplest, and probably enough), **or**
- add `GET /v1/dishes?search=dosa&address_id=1` returning dishes with their
  restaurant attached.

Tell us which; we will build for whichever you pick.

---

## Two things that would save us time

**1. Send real example responses, not just the schema.** Building against the
live API this month turned up three cases where the documented field name and
the sent field name differ — cart lines arrive as `cart_item_id` where the
schema says `id`, and `GET /v1/carts` sends its item list rather than the
`item_count` the schema implies. Both were silent failures, not errors. One
sample response per endpoint would have caught them immediately.

**2. Keep types consistent.** Prices and booleans currently arrive as JSON
strings in some endpoints and numbers in others. The app coerces everything
defensively, so this is not blocking — but for the new endpoints, numbers as
numbers and booleans as booleans would be cleaner on both sides.

---

## What we can start on now

| Blocked on backend | Can build immediately |
|---|---|
| Banner carousel | Filter and sort **sheet UI** |
| Cuisine rail | VEG toggle **UI** |
| Rating badges | Card layout with offer ribbons |
| Offer ribbons | Grid layout for "Recommended" |
| Sort and filter results | Bottom-nav restructure |
| Favourites | Cuisine sheet **layout** |

We will build the UI against the shapes above so that wiring is a repository
change, not a redesign. If any shape here is wrong for you, tell us before we
build rather than after — changing the model is cheap now.
