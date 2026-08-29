import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'app_motion.dart';

/// Sweeps a highlight across everything below it.
///
/// One controller drives the whole subtree, so a screenful of placeholder
/// blocks costs a single animation rather than one per block.
///
/// A spinner tells the customer "wait". A skeleton in the shape of the content
/// tells them what is coming and makes the same wait feel shorter — which is
/// why every delivery app uses one and why the bare
/// [CircularProgressIndicator] was the single thing making these screens feel
/// unfinished.
class Shimmer extends StatefulWidget {
  const Shimmer({super.key, required this.child});

  final Widget child;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1350),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final Color base = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.surfaceContainerLow;
    final Color highlight = isDark
        ? Color.alphaBlend(Colors.white.withValues(alpha: 0.06), base)
        : Colors.white;

    // Reduced motion still gets the layout, just without the sweep — the shape
    // of what is loading is the useful part; the shine is decoration.
    if (AppMotion.reduced(context)) {
      return SkeletonTint(color: base, child: widget.child);
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            // Travel from fully off one edge to fully off the other, so the
            // highlight never sits parked at the end of its run.
            final double t = _controller.value * 2 - 1;
            return LinearGradient(
              begin: Alignment(t - 0.6, -0.3),
              end: Alignment(t + 0.6, 0.3),
              colors: <Color>[base, highlight, base],
              stops: const <double>[0.15, 0.5, 0.85],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: SkeletonTint(color: base, child: widget.child),
    );
  }
}

/// Paints every [SkeletonBox] below it in one flat colour, which the [Shimmer]
/// above then sweeps.
class SkeletonTint extends InheritedWidget {
  const SkeletonTint({super.key, required this.color, required super.child});

  final Color color;

  static Color of(BuildContext context) {
    final SkeletonTint? tint =
        context.dependOnInheritedWidgetOfExactType<SkeletonTint>();
    return tint?.color ?? Theme.of(context).colorScheme.surfaceContainerLow;
  }

  @override
  bool updateShouldNotify(SkeletonTint oldWidget) => color != oldWidget.color;
}

/// One placeholder block. Sized like the thing it stands in for.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height = 14,
    this.radius = 6,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: SkeletonTint.of(context),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

/// Placeholder in the shape of a restaurant card, so the real list dropping in
/// does not shift the page.
class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SkeletonBox(width: 92, height: 92, radius: 16),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SkeletonBox(width: 150, height: 17),
                const SizedBox(height: 10),
                const SkeletonBox(width: 108, height: 12),
                const SizedBox(height: 8),
                const SkeletonBox(width: 132, height: 12),
                const SizedBox(height: 8),
                SkeletonBox(width: 76, height: 12, radius: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Placeholder in the shape of a menu row.
class MenuRowSkeleton extends StatelessWidget {
  const MenuRowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SkeletonBox(width: 16, height: 16, radius: 4),
              SizedBox(height: 10),
              SkeletonBox(width: 160, height: 16),
              SizedBox(height: 8),
              SkeletonBox(width: 64, height: 14),
              SizedBox(height: 10),
              SkeletonBox(height: 12),
              SizedBox(height: 6),
              SkeletonBox(width: 180, height: 12),
            ],
          ),
        ),
        const SizedBox(width: 14),
        Column(
          children: const <Widget>[
            SkeletonBox(width: 96, height: 96, radius: 16),
            SizedBox(height: 8),
            SkeletonBox(width: 104, height: 38, radius: 10),
          ],
        ),
      ],
    );
  }
}

/// The whole nearby list while it loads.
class NearbySkeleton extends StatelessWidget {
  const NearbySkeleton({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            for (int i = 0; i < count; i++) ...<Widget>[
              const RestaurantCardSkeleton(),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

/// One restaurant's menu while it loads.
class MenuSkeleton extends StatelessWidget {
  const MenuSkeleton({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SkeletonBox(width: 180, height: 26, radius: 8),
            const SizedBox(height: 8),
            const SkeletonBox(width: 120, height: 14),
            const SizedBox(height: 28),
            for (int i = 0; i < count; i++) ...<Widget>[
              const MenuRowSkeleton(),
              const SizedBox(height: 28),
            ],
          ],
        ),
      ),
    );
  }
}
