import 'package:flutter/material.dart';

import 'app_motion.dart';

/// Shrinks slightly while held.
///
/// The tactile signal every good delivery app has and a plain `InkWell` does
/// not: a ripple tells you *where* you touched, a scale tells you the whole
/// card is the button. Used on restaurant cards, deal cards and order rows.
///
/// Release overshoots very slightly ([AppMotion.spring]) so the card settles
/// rather than snapping.
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 0.97,
    this.borderRadius,
  });

  final Widget child;
  final VoidCallback? onTap;

  /// How far down it goes. Under 0.95 starts to look like the card is falling
  /// away from the finger.
  final double scale;

  final BorderRadius? borderRadius;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _held = false;

  void _set(bool value) {
    if (widget.onTap == null || _held == value) return;
    setState(() => _held = value);
  }

  @override
  Widget build(BuildContext context) {
    final Widget target = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => _set(true),
      onTapUp: (_) => _set(false),
      onTapCancel: () => _set(false),
      child: Semantics(
        button: widget.onTap != null,
        child: widget.child,
      ),
    );

    if (AppMotion.reduced(context)) return target;

    return AnimatedScale(
      scale: _held ? widget.scale : 1,
      duration: AppMotion.instant,
      curve: _held ? AppMotion.enter : AppMotion.spring,
      child: target,
    );
  }
}
