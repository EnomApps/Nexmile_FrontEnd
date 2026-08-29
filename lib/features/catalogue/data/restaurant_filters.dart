import 'package:flutter/foundation.dart';

/// How the nearby list is ordered.
enum RestaurantSort { relevance, rating, deliveryTime, costLowHigh, costHighLow }

extension RestaurantSortX on RestaurantSort {
  /// The value sent as `?sort=`. Snake case, matching the API request spec.
  String get query => switch (this) {
        RestaurantSort.relevance => 'relevance',
        RestaurantSort.rating => 'rating',
        RestaurantSort.deliveryTime => 'delivery_time',
        RestaurantSort.costLowHigh => 'cost_low_high',
        RestaurantSort.costHighLow => 'cost_high_low',
      };
}

/// A price bracket from the "Dish Price" filter, as `cost_min`–`cost_max`.
@immutable
class CostBracket {
  const CostBracket({this.min, this.max});

  final int? min;
  final int? max;

  bool get isAny => min == null && max == null;

  @override
  bool operator ==(Object other) =>
      other is CostBracket && other.min == min && other.max == max;

  @override
  int get hashCode => Object.hash(min, max);
}

/// Everything the filter sheet and the chip row can set.
///
/// Immutable so a sheet can edit a working copy and the screen only re-queries
/// when the customer confirms — tapping through five options should not fire
/// five requests.
@immutable
class RestaurantFilters {
  const RestaurantFilters({
    this.sort = RestaurantSort.relevance,
    this.cuisines = const <String>{},
    this.ratingMin,
    this.cost = const CostBracket(),
    this.vegOnly = false,
    this.freeDelivery = false,
    this.noPackagingFee = false,
    this.nearAndFast = false,
    this.hasOffers = false,
    this.openNow = false,
  });

  final RestaurantSort sort;
  final Set<String> cuisines;

  /// 3.5 or 4.0 in the sheet, but kept as a number so the server can offer
  /// other thresholds through `GET /v1/filters` without an app change.
  final double? ratingMin;

  final CostBracket cost;
  final bool vegOnly;
  final bool freeDelivery;
  final bool noPackagingFee;

  /// Deliberately a flag rather than a distance the app computes: the backend
  /// owns what "near and fast" means, so the two cannot disagree.
  final bool nearAndFast;

  final bool hasOffers;
  final bool openNow;

  static const RestaurantFilters none = RestaurantFilters();

  /// True when anything is set. Drives the dot on the Filters chip.
  bool get isActive =>
      sort != RestaurantSort.relevance ||
      cuisines.isNotEmpty ||
      ratingMin != null ||
      !cost.isAny ||
      vegOnly ||
      freeDelivery ||
      noPackagingFee ||
      nearAndFast ||
      hasOffers ||
      openNow;

  /// How many are set, for the "Filters (3)" label. Sort is excluded — there
  /// is always a sort, so counting it would show "1" on an untouched list.
  int get activeCount {
    int n = 0;
    if (cuisines.isNotEmpty) n += cuisines.length;
    if (ratingMin != null) n++;
    if (!cost.isAny) n++;
    if (vegOnly) n++;
    if (freeDelivery) n++;
    if (noPackagingFee) n++;
    if (nearAndFast) n++;
    if (hasOffers) n++;
    if (openNow) n++;
    return n;
  }

  RestaurantFilters copyWith({
    RestaurantSort? sort,
    Set<String>? cuisines,
    double? ratingMin,
    bool clearRating = false,
    CostBracket? cost,
    bool? vegOnly,
    bool? freeDelivery,
    bool? noPackagingFee,
    bool? nearAndFast,
    bool? hasOffers,
    bool? openNow,
  }) {
    return RestaurantFilters(
      sort: sort ?? this.sort,
      cuisines: cuisines ?? this.cuisines,
      // A null `ratingMin` cannot mean "unchanged" and "cleared" at once, so
      // clearing is an explicit flag.
      ratingMin: clearRating ? null : (ratingMin ?? this.ratingMin),
      cost: cost ?? this.cost,
      vegOnly: vegOnly ?? this.vegOnly,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      noPackagingFee: noPackagingFee ?? this.noPackagingFee,
      nearAndFast: nearAndFast ?? this.nearAndFast,
      hasOffers: hasOffers ?? this.hasOffers,
      openNow: openNow ?? this.openNow,
    );
  }

  RestaurantFilters toggleCuisine(String slug) {
    final Set<String> next = Set<String>.of(cuisines);
    if (!next.remove(slug)) next.add(slug);
    return copyWith(cuisines: next);
  }

  /// Query parameters, omitting anything unset so the request stays the same
  /// shape it is today until a filter is actually applied.
  ///
  /// The cuisine key carries **brackets** — `cuisine[]`. Laravel keeps only the
  /// last value of a repeated key without them, and does it silently, so a
  /// two-cuisine filter would quietly become a one-cuisine filter.
  Map<String, List<String>> toQuery() {
    return <String, List<String>>{
      if (sort != RestaurantSort.relevance) 'sort': <String>[sort.query],
      if (cuisines.isNotEmpty) 'cuisine[]': cuisines.toList(growable: false),
      if (ratingMin != null) 'rating_min': <String>['$ratingMin'],
      if (cost.min != null) 'cost_min': <String>['${cost.min}'],
      if (cost.max != null) 'cost_max': <String>['${cost.max}'],
      if (vegOnly) 'veg_only': const <String>['1'],
      if (freeDelivery) 'free_delivery': const <String>['1'],
      if (noPackagingFee) 'no_packaging_fee': const <String>['1'],
      if (nearAndFast) 'near_and_fast': const <String>['1'],
      if (hasOffers) 'has_offers': const <String>['1'],
      if (openNow) 'open_now': const <String>['1'],
    };
  }

  @override
  bool operator ==(Object other) =>
      other is RestaurantFilters &&
      other.sort == sort &&
      setEquals(other.cuisines, cuisines) &&
      other.ratingMin == ratingMin &&
      other.cost == cost &&
      other.vegOnly == vegOnly &&
      other.freeDelivery == freeDelivery &&
      other.noPackagingFee == noPackagingFee &&
      other.nearAndFast == nearAndFast &&
      other.hasOffers == hasOffers &&
      other.openNow == openNow;

  @override
  int get hashCode => Object.hash(
        sort,
        Object.hashAllUnordered(cuisines),
        ratingMin,
        cost,
        vegOnly,
        freeDelivery,
        noPackagingFee,
        nearAndFast,
        hasOffers,
        openNow,
      );
}
