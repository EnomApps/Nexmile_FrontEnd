import 'dart:async';

import 'package:flutter/material.dart';

import 'app_motion.dart';

/// Fades and lifts its child into place once, on first build.
///
/// Two implicit animations rather than an [AnimationController], because these
/// appear dozens at a time in a list and a controller each would be wasteful.
///
/// Pass [index] to stagger siblings. The delay is capped inside
/// [AppMotion.delayFor], so a long list still finishes arriving promptly.
class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.index = 0,
    this.delay = Duration.zero,
    this.duration = AppMotion.quick,

    /// Which way the child travels in from. Down is the default — content
    /// arriving from below reads as "more of the page", which is what a feed
    /// item is.
    this.from = AxisDirection.down,
  });

  final Widget child;
  final int index;
  final Duration delay;
  final Duration duration;
  final AxisDirection from;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  bool _shown = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final Duration wait = widget.delay + AppMotion.delayFor(widget.index);
    if (wait == Duration.zero) {
      // Still a frame late, so the implicit animations have a start state to
      // animate away from.
      WidgetsBinding.instance.addPostFrameCallback((_) => _show());
    } else {
      _timer = Timer(wait, _show);
    }
  }

  void _show() {
    if (mounted) setState(() => _shown = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Offset get _offset {
    if (_shown) return Offset.zero;
    return switch (widget.from) {
      AxisDirection.down => const Offset(0, 0.06),
      AxisDirection.up => const Offset(0, -0.06),
      AxisDirection.left => const Offset(-0.06, 0),
      AxisDirection.right => const Offset(0.06, 0),
    };
  }

  @override
  Widget build(BuildContext context) {
    // Reduced motion means place it, do not move it. Skipping the widgets
    // entirely also keeps them out of the tree for tests, which would otherwise
    // never reach a quiescent frame.
    if (AppMotion.reduced(context)) return widget.child;

    return AnimatedSlide(
      offset: _offset,
      duration: widget.duration,
      curve: AppMotion.enter,
      child: AnimatedOpacity(
        opacity: _shown ? 1 : 0,
        duration: widget.duration,
        curve: AppMotion.enter,
        child: widget.child,
      ),
    );
  }
}

/// Wraps each child of a list in a staggered [Reveal].
///
/// Useful where the children are built eagerly; for a long `ListView` prefer
/// wrapping inside `itemBuilder` so only visible rows animate.
List<Widget> revealAll(List<Widget> children, {Duration delay = Duration.zero}) {
  return <Widget>[
    for (int i = 0; i < children.length; i++)
      Reveal(index: i, delay: delay, child: children[i]),
  ];
}
