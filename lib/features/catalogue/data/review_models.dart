import 'package:flutter/foundation.dart';

import 'storefront_models.dart';

/// What a restaurant's ratings add up to.
///
/// [rating] is null until the restaurant has any, and is deliberately never
/// zero: "0.0" reads as *bad*, where an unrated shop is merely new. Same rule
/// the cards already follow.
@immutable
class ReviewSummary {
  const ReviewSummary({
    required this.rating,
    required this.ratingCount,
    required this.breakdown,
  });

  static const ReviewSummary empty = ReviewSummary(
    rating: null,
    ratingCount: 0,
    breakdown: <int, int>{},
  );

  final double? rating;
  final int ratingCount;

  /// Star (1–5) to how many people gave it. Missing stars mean nobody did, so
  /// the histogram reads them as zero rather than as a gap.
  final Map<int, int> breakdown;

  bool get hasRating => rating != null && ratingCount > 0;

  int countFor(int star) => breakdown[star] ?? 0;

  /// The tallest bar, used to scale the rest. Never zero, so the histogram
  /// cannot divide by it.
  int get busiestStar {
    int most = 0;
    for (final int count in breakdown.values) {
      if (count > most) most = count;
    }
    return most == 0 ? 1 : most;
  }

  static ReviewSummary fromMeta(Map<String, dynamic> meta) {
    final Object? raw = meta['breakdown'];
    final Map<int, int> breakdown = <int, int>{};
    if (raw is Map) {
      for (final MapEntry<Object?, Object?> entry in raw.entries) {
        final int? star = int.tryParse('${entry.key}');
        // Anything outside 1–5 is not a star and has no bar to go in.
        if (star == null || star < 1 || star > 5) continue;
        breakdown[star] = asInt(entry.value);
      }
    }

    return ReviewSummary(
      rating: meta['rating'] == null ? null : asDouble(meta['rating']),
      ratingCount: asInt(meta['rating_count']),
      breakdown: Map<int, int>.unmodifiable(breakdown),
    );
  }
}

/// One customer's rating, and their words if they left any.
@immutable
class Review {
  const Review({
    required this.id,
    required this.author,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  final int id;

  /// A first name, by design — the API never sends more than that.
  final String author;

  final int rating;

  /// Null or blank on a rating with no text, which is most of them.
  final String? comment;

  final DateTime? createdAt;

  bool get hasComment => (comment ?? '').trim().isNotEmpty;

  static Review fromJson(Map<String, dynamic> json) {
    final String comment = asString(json['comment']);
    return Review(
      id: asInt(json['id']),
      author: asString(json['author']),
      rating: asInt(json['rating']),
      comment: comment.trim().isEmpty ? null : comment,
      createdAt: asDate(json['created_at']),
    );
  }
}

/// One page of reviews, newest first, with the summary that came alongside.
///
/// Moderation can remove a review between two fetches, so a page is a snapshot
/// and never a cache: the screen re-reads from the first page whenever it is
/// opened rather than restoring what it had last time.
@immutable
class ReviewPage {
  const ReviewPage({
    required this.items,
    required this.summary,
    required this.page,
    required this.hasMore,
  });

  final List<Review> items;
  final ReviewSummary summary;
  final int page;
  final bool hasMore;

  static ReviewPage fromJson(
    List<Map<String, dynamic>> data,
    Map<String, dynamic> meta,
  ) {
    final int page = meta['current_page'] == null ? 1 : asInt(meta['current_page']);
    final Object? last = meta['last_page'];

    return ReviewPage(
      items: data.map(Review.fromJson).toList(growable: false),
      summary: ReviewSummary.fromMeta(meta),
      page: page,
      // Trust `last_page` when the server sends it. Without it, a full page is
      // the only hint there is more — and an empty one is proof there is not.
      hasMore: last != null
          ? page < asInt(last)
          : data.isNotEmpty && meta['per_page'] != null
              ? data.length >= asInt(meta['per_page'])
              : false,
    );
  }
}
