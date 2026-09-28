import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_motion.dart';

/// The app's waiting animation: a bowl with steam rising off it.
///
/// Drawn rather than played from a GIF or a Lottie file, for three reasons a
/// food app feels every one of: it takes the brand colours (and the dark
/// theme's) instead of baking them into pixels, it stays sharp at any size on
/// any screen, and it costs a few kilobytes of code instead of a megabyte of
/// frames on a connection that is often a bar of 4G in a lift.
///
/// A [CircularProgressIndicator] says "wait". This says "food is coming",
/// which is the same wait made to feel shorter — the whole trick behind a
/// skeleton, applied to the moments where there is no shape to skeleton yet.
/// Where there *is* a shape, prefer [Shimmer] and a skeleton: telling someone
/// what is arriving beats entertaining them while it does.
class NexmileLoader extends StatefulWidget {
  const NexmileLoader({super.key, this.size = 64, this.message});

  /// Width of the bowl. The steam is drawn above it, so the widget occupies
  /// roughly 1.6× this in height.
  final double size;

  /// An optional line under the bowl — "Finding restaurants near you". Comes
  /// from the caller already translated; this widget owns no copy of its own.
  final String? message;

  @override
  State<NexmileLoader> createState() => _NexmileLoaderState();
}

class _NexmileLoaderState extends State<NexmileLoader>
    with SingleTickerProviderStateMixin {
  /// One cycle of steam. Slow on purpose: steam that hurries reads as a
  /// progress bar, and this is deliberately not one — it makes no claim about
  /// how much longer the wait will be.
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool reduced = AppMotion.reduced(context);

    final Widget bowl = SizedBox(
      width: widget.size,
      height: widget.size * 1.6,
      child: reduced
          // Still the bowl, just standing still: someone who asked for less
          // motion has not asked for a worse-looking app.
          ? CustomPaint(
              painter: _BowlPainter(progress: 0, steam: false, theme: theme),
            )
          : AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) => CustomPaint(
                painter: _BowlPainter(
                  progress: _controller.value,
                  steam: true,
                  theme: theme,
                ),
              ),
            ),
    );

    final String? message = widget.message;
    if (message == null) return Center(child: bowl);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          bowl,
          const SizedBox(height: 14),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _BowlPainter extends CustomPainter {
  _BowlPainter({
    required this.progress,
    required this.steam,
    required this.theme,
  });

  /// 0–1, one full turn of the steam cycle.
  final double progress;
  final bool steam;
  final ThemeData theme;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double bowlHeight = width * 0.52;

    // The bowl breathes very slightly, as though set down and settling. Two
    // pixels: enough to stop the drawing looking frozen, small enough that
    // nobody consciously sees it move.
    final double bob = steam ? math.sin(progress * 2 * math.pi) * 1.6 : 0;
    final double bowlTop = size.height - bowlHeight - 6 + bob;

    if (steam) _paintSteam(canvas, size, bowlTop);

    // Centred on the rim, so the arc's flat edge *is* the rim rather than
    // hanging below it.
    final Rect bowlRect =
        Rect.fromLTWH(0, bowlTop - bowlHeight, width, bowlHeight * 2);

    // The body: the bottom half of an oval, so the rim is a straight line the
    // steam can rise from and the base is round.
    final Paint body = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[AppColors.green, AppColors.greenDeep],
      ).createShader(bowlRect);
    canvas.drawArc(bowlRect, 0, math.pi, false, body);

    // The rim, a touch lighter, so the bowl reads as three-dimensional at
    // 24px as well as at 96.
    final Paint rim = Paint()
      ..color = AppColors.greenLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = math.max(2, width * 0.045)
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(width * 0.03, bowlTop),
      Offset(width * 0.97, bowlTop),
      rim,
    );
  }

  /// Three wisps, each offset a third of a cycle from the last, so the loop
  /// never shows an empty moment or a rank of three identical puffs.
  void _paintSteam(Canvas canvas, Size size, double bowlTop) {
    const int wisps = 3;
    final double width = size.width;
    final double travel = bowlTop * 0.72;

    for (int i = 0; i < wisps; i++) {
      final double phase = (progress + i / wisps) % 1;

      // Fades in off the rim and out before the top, so nothing pops.
      final double opacity = phase < 0.15
          ? phase / 0.15
          : phase > 0.75
              ? (1 - phase) / 0.25
              : 1;

      final double y = bowlTop - travel * phase;
      final double x = width * (0.28 + 0.22 * i) +
          // The sway is what makes it steam rather than a rising dot.
          math.sin(phase * math.pi * 2.2 + i) * width * 0.06;

      final Paint paint = Paint()
        ..color = (i.isEven ? AppColors.orangeLight : AppColors.orange)
            .withValues(alpha: 0.65 * opacity.clamp(0, 1))
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(2, width * 0.05)
        ..strokeCap = StrokeCap.round;

      // A short curl rather than a straight line: two control points in
      // opposite directions give the S-bend that reads as heat.
      // A long S-curl rather than a straight line: two bends in opposite
      // directions are what read as heat rather than as a rising dash.
      final double curl = travel * 0.3;
      final Path path = Path()
        ..moveTo(x, y)
        ..quadraticBezierTo(x + width * 0.09, y - curl * 0.5, x, y - curl)
        ..quadraticBezierTo(
          x - width * 0.09,
          y - curl * 1.5,
          x,
          y - curl * 2,
        );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BowlPainter old) =>
      old.progress != progress ||
      old.steam != steam ||
      old.theme.brightness != theme.brightness;
}

/// The inline size, for a button or a row that is waiting on one call.
///
/// Small enough that the bowl reads as a mark rather than an illustration, and
/// sized to sit where a [CircularProgressIndicator] used to without moving
/// anything around it.
class NexmileLoaderSmall extends StatelessWidget {
  const NexmileLoaderSmall({super.key, this.size = 22});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size * 1.6,
        child: NexmileLoader(size: size),
      );
}
