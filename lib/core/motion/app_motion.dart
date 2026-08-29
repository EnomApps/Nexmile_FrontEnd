import 'package:flutter/material.dart';

/// Motion tokens.
///
/// One set of durations and curves for the whole app, so a card, a sheet and a
/// bottom bar all move like they belong to the same product. Timings are on the
/// quick side — a food app should feel like it is keeping up with a hungry
/// person, not performing for them.
class AppMotion {
  const AppMotion._();

  /// A press, a colour change, a checkbox — anything the finger is still on.
  static const Duration instant = Duration(milliseconds: 120);

  /// The default. Content entering, a bar sliding up, a stepper morphing.
  static const Duration quick = Duration(milliseconds: 260);

  /// A sheet, a hero, a screen-level change worth watching.
  static const Duration settled = Duration(milliseconds: 420);

  /// Gap between staggered siblings. Small enough to read as one gesture
  /// rather than a queue.
  static const Duration stagger = Duration(milliseconds: 45);

  /// Standard entrance and exit. `easeOutCubic` decelerates hard, which is what
  /// makes content feel like it is arriving rather than drifting.
  static const Curve enter = Curves.easeOutCubic;
  static const Curve exit = Curves.easeInCubic;

  /// A slight overshoot for things that should feel physical — the press
  /// release on a card, the cart bar landing.
  static const Curve spring = Curves.easeOutBack;

  /// Distance content travels while fading in. Deliberately small: a long
  /// slide reads as slow even when the duration is short.
  static const double riseOffset = 14;

  /// Honour the OS "reduce motion" setting, and the flag Flutter's own tests
  /// set. Both mean the same thing here: place things, do not move them.
  static bool reduced(BuildContext context) =>
      MediaQuery.disableAnimationsOf(context);

  /// Staggered delay for item [index], capped so the fortieth restaurant in a
  /// list does not wait two seconds to appear.
  static Duration delayFor(int index, {int cap = 8}) =>
      stagger * index.clamp(0, cap);
}
