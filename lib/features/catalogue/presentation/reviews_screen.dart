import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/motion/reveal.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../../core/network/api_exception.dart';
import '../../auth/data/auth_failure.dart';
import '../data/review_models.dart';
import '../data/storefront_repository.dart';
import 'widgets/catalogue_widgets.dart';

/// Everything customers have said about one restaurant.
///
/// Deliberately stateful and uncached: moderation can take a review down
/// between two visits, so the screen always re-reads from page one rather than
/// restoring a list it kept.
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.args});

  final ReviewsArgs args;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final ScrollController _scroll = ScrollController();

  final List<Review> _reviews = <Review>[];
  ReviewSummary _summary = ReviewSummary.empty;

  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = false;
  bool _withCommentOnly = false;
  int _page = 1;
  AuthFailure? _failure;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _load();
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_hasMore || _isLoadingMore || _isLoading) return;
    // A screen ahead of the bottom, so the next page is usually already there
    // by the time the customer reaches it.
    if (_scroll.position.pixels >=
        _scroll.position.maxScrollExtent - _scroll.position.viewportDimension) {
      _loadMore();
    }
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _failure = null;
    });

    try {
      final ReviewPage page = await context.read<StorefrontRepository>().reviews(
            widget.args.restaurantId,
            withCommentOnly: _withCommentOnly,
          );
      if (!mounted) return;
      setState(() {
        _reviews
          ..clear()
          ..addAll(page.items);
        _summary = page.summary;
        _page = page.page;
        _hasMore = page.hasMore;
        _isLoading = false;
      });
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _failure = authFailureFrom(error, validationFailure: AuthFailure.unknown);
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _failure = AuthFailure.unknown;
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);
    try {
      final ReviewPage page = await context.read<StorefrontRepository>().reviews(
            widget.args.restaurantId,
            page: _page + 1,
            withCommentOnly: _withCommentOnly,
          );
      if (!mounted) return;
      setState(() {
        _reviews.addAll(page.items);
        _page = page.page;
        _hasMore = page.hasMore;
        _isLoadingMore = false;
      });
    } catch (_) {
      // A failed next page is not worth an error screen over a list that is
      // already on screen; the customer can pull to try again.
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  void _toggleWithComment(bool value) {
    setState(() => _withCommentOnly = value);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ratingsAndReviews)),
      body: RefreshIndicator(
        onRefresh: _load,
        child: CustomScrollView(
          controller: _scroll,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            if (_summary.hasRating)
              SliverToBoxAdapter(child: _SummaryCard(summary: _summary)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: FilterChip(
                    selected: _withCommentOnly,
                    onSelected: _toggleWithComment,
                    label: Text(l10n.reviewsWithTextOnly),
                    showCheckmark: true,
                  ),
                ),
              ),
            ),
            if (_isLoading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (_failure != null && _reviews.isEmpty)
              SliverToBoxAdapter(
                child: EmptyState(
                  emoji: '📡',
                  title: l10n.somethingWentWrong,
                  subtitle: _failure!.message(l10n),
                  action: OutlinedButton(
                    onPressed: _load,
                    child: Text(l10n.retry),
                  ),
                ),
              )
            else if (_reviews.isEmpty)
              SliverToBoxAdapter(
                child: EmptyState(
                  emoji: '⭐',
                  title: l10n.noReviewsTitle,
                  subtitle: l10n.noReviewsSubtitle,
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                sliver: SliverList.separated(
                  itemCount: _reviews.length,
                  separatorBuilder: (_, __) => const Divider(height: 28),
                  itemBuilder: (BuildContext context, int i) => Reveal(
                    index: i,
                    child: _ReviewTile(review: _reviews[i]),
                  ),
                ),
              ),
            if (_isLoadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 28),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// The number, and where it came from.
class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});

  final ReviewSummary summary;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                summary.rating!.toStringAsFixed(1),
                // A rating reads left to right in every language.
                textDirection: TextDirection.ltr,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const SizedBox(height: 6),
              StarRow(rating: summary.rating!, size: 16),
              const SizedBox(height: 6),
              Text(
                l10n.ratingsCount(summary.ratingCount),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Five bars, tallest first, so the shape of the opinion is readable
          // before a single review is.
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (int star = 5; star >= 1; star--)
                  _HistogramRow(
                    star: star,
                    count: summary.countFor(star),
                    busiest: summary.busiestStar,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistogramRow extends StatelessWidget {
  const _HistogramRow({
    required this.star,
    required this.count,
    required this.busiest,
  });

  final int star;
  final int count;
  final int busiest;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16,
            child: Text(
              '$star',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.end,
              style: theme.textTheme.labelSmall,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: LinearProgressIndicator(
                value: count / busiest,
                minHeight: 7,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(
                  star >= 4 ? const Color(0xFF0F8A0F) : AppColors.orangeDeep,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 30,
            child: Text(
              '$count',
              textDirection: TextDirection.ltr,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.greenDeep.withValues(alpha: 0.12),
              child: Text(
                review.author.isEmpty ? '?' : review.author[0].toUpperCase(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.greenDeep,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                review.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            StarRow(rating: review.rating.toDouble(), size: 14),
          ],
        ),
        if (review.hasComment) ...<Widget>[
          const SizedBox(height: 8),
          Text(review.comment!, style: theme.textTheme.bodyMedium),
        ],
      ],
    );
  }
}
