import 'catalogue_models.dart';

/// Stand-in storefront data for the prototype.
///
/// Everything here is invented. When the catalogue API arrives, replace
/// [CatalogueRepository] with an HTTP implementation — the screens read through
/// the interface and never touch this file.
abstract class CatalogueRepository {
  List<FoodCategory> categories();

  List<Offer> offers();

  List<Restaurant> restaurants();

  Restaurant? restaurantById(String id);

  /// Matches restaurant names, cuisines and dish names.
  List<Restaurant> search(String query);

  List<Restaurant> byCategory(String categoryId);
}

class SampleCatalogue implements CatalogueRepository {
  const SampleCatalogue();

  @override
  List<FoodCategory> categories() => _categories;

  @override
  List<Offer> offers() => _offers;

  @override
  List<Restaurant> restaurants() => _restaurants;

  @override
  Restaurant? restaurantById(String id) {
    for (final Restaurant r in _restaurants) {
      if (r.id == id) return r;
    }
    return null;
  }

  @override
  List<Restaurant> search(String query) {
    final String q = query.trim().toLowerCase();
    if (q.isEmpty) return _restaurants;
    return _restaurants.where((Restaurant r) {
      if (r.name.toLowerCase().contains(q)) return true;
      if (r.cuisines.any((String c) => c.toLowerCase().contains(q))) return true;
      return r.allDishes.any((Dish d) => d.name.toLowerCase().contains(q));
    }).toList();
  }

  @override
  List<Restaurant> byCategory(String categoryId) {
    if (categoryId == 'all') return _restaurants;
    return _restaurants
        .where((Restaurant r) => r.cuisines
            .map((String c) => c.toLowerCase())
            .contains(categoryId.toLowerCase()))
        .toList();
  }
}

// ---------------------------------------------------------------------------
// Categories
// ---------------------------------------------------------------------------

const List<FoodCategory> _categories = <FoodCategory>[
  FoodCategory(id: 'biryani', name: 'Biryani', emoji: '🍛'),
  FoodCategory(id: 'south indian', name: 'South Indian', emoji: '🥘'),
  FoodCategory(id: 'pizza', name: 'Pizza', emoji: '🍕'),
  FoodCategory(id: 'burger', name: 'Burger', emoji: '🍔'),
  FoodCategory(id: 'chinese', name: 'Chinese', emoji: '🍜'),
  FoodCategory(id: 'desserts', name: 'Desserts', emoji: '🍰'),
  FoodCategory(id: 'beverages', name: 'Beverages', emoji: '🥤'),
  FoodCategory(id: 'north indian', name: 'North Indian', emoji: '🍲'),
];

// ---------------------------------------------------------------------------
// Offers
// ---------------------------------------------------------------------------

const List<Offer> _offers = <Offer>[
  Offer(
    id: 'o1',
    title: '50% OFF',
    subtitle: 'up to ₹100 on your first order',
    code: 'NEXFIRST',
  ),
  Offer(
    id: 'o2',
    title: 'FREE DELIVERY',
    subtitle: 'on orders above ₹299',
    code: 'FREESHIP',
  ),
  Offer(
    id: 'o3',
    title: '₹75 OFF',
    subtitle: 'on South Indian favourites',
    code: 'SOUTH75',
  ),
];

// ---------------------------------------------------------------------------
// Restaurants
// ---------------------------------------------------------------------------

final List<Restaurant> _restaurants = <Restaurant>[
  Restaurant(
    id: 'r1',
    name: 'Anjappar Chettinad',
    cuisines: <String>['South Indian', 'Biryani', 'Chettinad'],
    rating: 4.4,
    ratingsCount: 2840,
    deliveryMinutes: 28,
    priceForTwo: 400,
    distanceKm: 1.2,
    emoji: '🍛',
    offerPercent: 40,
    menu: <MenuSection>[
      MenuSection(
        title: 'Bestsellers',
        dishes: <Dish>[
          Dish(
            id: 'r1d1',
            name: 'Chicken Biryani',
            description:
                'Seeraga samba rice, slow-cooked chicken, house masala. Served with raita.',
            price: 249,
            isVeg: false,
            emoji: '🍛',
            isBestseller: true,
            rating: 4.5,
          ),
          Dish(
            id: 'r1d2',
            name: 'Mutton Chukka',
            description: 'Dry-roasted mutton with curry leaves and pepper.',
            price: 329,
            isVeg: false,
            emoji: '🥘',
            isBestseller: true,
            rating: 4.3,
          ),
          Dish(
            id: 'r1d3',
            name: 'Veg Biryani',
            description: 'Seasonal vegetables layered with fragrant rice.',
            price: 199,
            isVeg: true,
            emoji: '🍚',
            rating: 4.1,
          ),
        ],
      ),
      MenuSection(
        title: 'Starters',
        dishes: <Dish>[
          Dish(
            id: 'r1d4',
            name: 'Chicken 65',
            description: 'Crisp fried chicken tossed with curry leaf and chilli.',
            price: 219,
            isVeg: false,
            emoji: '🍗',
            rating: 4.4,
          ),
          Dish(
            id: 'r1d5',
            name: 'Paneer 65',
            description: 'Cottage cheese, same spicing, no compromise.',
            price: 189,
            isVeg: true,
            emoji: '🧀',
          ),
        ],
      ),
      MenuSection(
        title: 'Breads',
        dishes: <Dish>[
          Dish(
            id: 'r1d6',
            name: 'Parotta (2 pcs)',
            description: 'Flaky layered parotta, made to order.',
            price: 60,
            isVeg: true,
            emoji: '🫓',
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r2',
    name: 'Saravana Bhavan',
    cuisines: <String>['South Indian', 'Desserts'],
    rating: 4.6,
    ratingsCount: 5120,
    deliveryMinutes: 22,
    priceForTwo: 250,
    distanceKm: 0.8,
    emoji: '🥘',
    isPureVeg: true,
    freeDelivery: true,
    menu: <MenuSection>[
      MenuSection(
        title: 'Tiffin',
        dishes: <Dish>[
          Dish(
            id: 'r2d1',
            name: 'Ghee Masala Dosa',
            description: 'Crisp dosa, spiced potato, ghee roasted.',
            price: 139,
            isVeg: true,
            emoji: '🥞',
            isBestseller: true,
            rating: 4.7,
          ),
          Dish(
            id: 'r2d2',
            name: 'Idli Sambar (3 pcs)',
            description: 'Steamed idli with sambar and two chutneys.',
            price: 89,
            isVeg: true,
            emoji: '🍥',
            isBestseller: true,
            rating: 4.5,
          ),
          Dish(
            id: 'r2d3',
            name: 'Pongal',
            description: 'Rice and moong dal with pepper, cumin and ghee.',
            price: 109,
            isVeg: true,
            emoji: '🍲',
          ),
        ],
      ),
      MenuSection(
        title: 'Sweets',
        dishes: <Dish>[
          Dish(
            id: 'r2d4',
            name: 'Filter Coffee',
            description: 'Degree coffee, served the proper way.',
            price: 49,
            isVeg: true,
            emoji: '☕',
            rating: 4.8,
          ),
          Dish(
            id: 'r2d5',
            name: 'Gulab Jamun (2 pcs)',
            description: 'Warm, soaked in cardamom syrup.',
            price: 79,
            isVeg: true,
            emoji: '🍮',
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r3',
    name: 'Napoli Pizza Co.',
    cuisines: <String>['Pizza', 'Italian', 'Beverages'],
    rating: 4.2,
    ratingsCount: 1460,
    deliveryMinutes: 35,
    priceForTwo: 550,
    distanceKm: 2.4,
    emoji: '🍕',
    offerPercent: 25,
    menu: <MenuSection>[
      MenuSection(
        title: 'Pizzas',
        dishes: <Dish>[
          Dish(
            id: 'r3d1',
            name: 'Margherita',
            description: 'San Marzano tomato, fior di latte, basil.',
            price: 299,
            isVeg: true,
            emoji: '🍕',
            isBestseller: true,
            rating: 4.4,
          ),
          Dish(
            id: 'r3d2',
            name: 'Peri Peri Chicken',
            description: 'Grilled chicken, peppers, peri peri drizzle.',
            price: 399,
            isVeg: false,
            emoji: '🍕',
            rating: 4.2,
          ),
        ],
      ),
      MenuSection(
        title: 'Sides',
        dishes: <Dish>[
          Dish(
            id: 'r3d3',
            name: 'Garlic Bread',
            description: 'Butter, garlic, herbs. Six pieces.',
            price: 149,
            isVeg: true,
            emoji: '🥖',
          ),
          Dish(
            id: 'r3d4',
            name: 'Cold Coffee',
            description: 'Thick, cold, lightly sweet.',
            price: 129,
            isVeg: true,
            emoji: '🥤',
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r4',
    name: 'Burger Junction',
    cuisines: <String>['Burger', 'Fast Food', 'Beverages'],
    rating: 4.0,
    ratingsCount: 980,
    deliveryMinutes: 20,
    priceForTwo: 300,
    distanceKm: 1.7,
    emoji: '🍔',
    offerPercent: 60,
    menu: <MenuSection>[
      MenuSection(
        title: 'Burgers',
        dishes: <Dish>[
          Dish(
            id: 'r4d1',
            name: 'Classic Chicken Burger',
            description: 'Crumb-fried patty, lettuce, mayo.',
            price: 159,
            isVeg: false,
            emoji: '🍔',
            isBestseller: true,
            rating: 4.1,
          ),
          Dish(
            id: 'r4d2',
            name: 'Aloo Tikki Burger',
            description: 'Spiced potato patty, mint chutney.',
            price: 99,
            isVeg: true,
            emoji: '🍔',
            rating: 4.0,
          ),
        ],
      ),
      MenuSection(
        title: 'Add-ons',
        dishes: <Dish>[
          Dish(
            id: 'r4d3',
            name: 'Peri Peri Fries',
            description: 'Crisp fries with peri peri seasoning.',
            price: 119,
            isVeg: true,
            emoji: '🍟',
            isBestseller: true,
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r5',
    name: 'Wok of Fame',
    cuisines: <String>['Chinese', 'Asian'],
    rating: 4.3,
    ratingsCount: 2110,
    deliveryMinutes: 32,
    priceForTwo: 450,
    distanceKm: 3.1,
    emoji: '🍜',
    menu: <MenuSection>[
      MenuSection(
        title: 'Noodles & Rice',
        dishes: <Dish>[
          Dish(
            id: 'r5d1',
            name: 'Hakka Noodles',
            description: 'Wok-tossed with garlic and spring onion.',
            price: 179,
            isVeg: true,
            emoji: '🍜',
            isBestseller: true,
            rating: 4.3,
          ),
          Dish(
            id: 'r5d2',
            name: 'Chicken Fried Rice',
            description: 'Egg, chicken, burnt garlic.',
            price: 209,
            isVeg: false,
            emoji: '🍚',
            rating: 4.2,
          ),
        ],
      ),
      MenuSection(
        title: 'Starters',
        dishes: <Dish>[
          Dish(
            id: 'r5d3',
            name: 'Chilli Paneer',
            description: 'Dry, glossy, properly spicy.',
            price: 229,
            isVeg: true,
            emoji: '🌶️',
            isBestseller: true,
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r6',
    name: 'Sweet Karma Bakes',
    cuisines: <String>['Desserts', 'Bakery', 'Beverages'],
    rating: 4.7,
    ratingsCount: 3320,
    deliveryMinutes: 25,
    priceForTwo: 350,
    distanceKm: 1.1,
    emoji: '🍰',
    isPureVeg: true,
    offerPercent: 20,
    menu: <MenuSection>[
      MenuSection(
        title: 'Cakes',
        dishes: <Dish>[
          Dish(
            id: 'r6d1',
            name: 'Belgian Chocolate Slice',
            description: 'Dense, dark, not too sweet.',
            price: 189,
            isVeg: true,
            emoji: '🍫',
            isBestseller: true,
            rating: 4.8,
          ),
          Dish(
            id: 'r6d2',
            name: 'Red Velvet Jar',
            description: 'Layered with cream cheese frosting.',
            price: 169,
            isVeg: true,
            emoji: '🍰',
            rating: 4.6,
          ),
        ],
      ),
      MenuSection(
        title: 'Shakes',
        dishes: <Dish>[
          Dish(
            id: 'r6d3',
            name: 'Filter Coffee Shake',
            description: 'Cold, thick, South Indian coffee base.',
            price: 149,
            isVeg: true,
            emoji: '🥤',
          ),
        ],
      ),
    ],
  ),
  Restaurant(
    id: 'r7',
    name: 'Punjab Grill House',
    cuisines: <String>['North Indian', 'Biryani', 'Tandoor'],
    rating: 4.1,
    ratingsCount: 1720,
    deliveryMinutes: 38,
    priceForTwo: 600,
    distanceKm: 4.0,
    emoji: '🍲',
    menu: <MenuSection>[
      MenuSection(
        title: 'Curries',
        dishes: <Dish>[
          Dish(
            id: 'r7d1',
            name: 'Butter Chicken',
            description: 'Tomato, cream, charred tandoori chicken.',
            price: 349,
            isVeg: false,
            emoji: '🍛',
            isBestseller: true,
            rating: 4.4,
          ),
          Dish(
            id: 'r7d2',
            name: 'Dal Makhani',
            description: 'Slow-cooked overnight with butter.',
            price: 249,
            isVeg: true,
            emoji: '🍲',
            rating: 4.3,
          ),
        ],
      ),
      MenuSection(
        title: 'Breads',
        dishes: <Dish>[
          Dish(
            id: 'r7d3',
            name: 'Butter Naan',
            description: 'Tandoor-baked, brushed with butter.',
            price: 59,
            isVeg: true,
            emoji: '🫓',
          ),
        ],
      ),
    ],
  ),
];
