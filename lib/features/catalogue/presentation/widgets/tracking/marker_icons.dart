import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/theme/app_colors.dart';

/// The tracking map's markers, painted once per screen at the device's pixel
/// ratio. Google markers cannot host widgets, so each is drawn to a bitmap.
class TrackingMarkerIcons {
  const TrackingMarkerIcons({
    required this.rider,
    required this.beam,
    required this.home,
    required this.shop,
  });

  /// The rider: a round badge with the delivery glyph, always upright.
  final BitmapDescriptor rider;

  /// A soft cone under the badge, pointing north. Drawn flat and rotated to
  /// the direction of travel, so the badge never turns upside down while the
  /// beam still shows which way the rider is going.
  final BitmapDescriptor beam;

  /// A teardrop with a house, tip on the delivery point.
  final BitmapDescriptor home;

  /// A smaller teardrop with a shop front, tip on the restaurant.
  final BitmapDescriptor shop;

  /// Logical size of [beam], which the map draws at this size in dp.
  static const double beamSize = 120;

  static Future<TrackingMarkerIcons> paint(double ratio) async {
    final List<BitmapDescriptor> icons =
        await Future.wait(<Future<BitmapDescriptor>>[
          _riderBadge(ratio),
          _beam(ratio),
          _teardrop(Icons.home_rounded, AppColors.greenDeep, 44, ratio),
          _teardrop(Icons.storefront_rounded, AppColors.inkMuted, 34, ratio),
        ]);
    return TrackingMarkerIcons(
      rider: icons[0],
      beam: icons[1],
      home: icons[2],
      shop: icons[3],
    );
  }

  static Future<BitmapDescriptor> _riderBadge(double ratio) {
    const double logical = 56;
    return _draw(logical, logical, ratio, (Canvas canvas, double s) {
      final Offset c = Offset(logical * s / 2, logical * s / 2);

      canvas.drawCircle(
        c.translate(0, 2 * s),
        21 * s,
        Paint()
          ..color = Colors.black.withValues(alpha: 0.28)
          ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, 4 * s),
      );
      canvas.drawCircle(c, 21 * s, Paint()..color = Colors.white);
      canvas.drawCircle(
        c,
        17.5 * s,
        Paint()
          ..shader = ui.Gradient.linear(
            c.translate(0, -17.5 * s),
            c.translate(0, 17.5 * s),
            const <Color>[AppColors.orangeLight, AppColors.orangeDeep],
          ),
      );
      _glyph(canvas, Icons.delivery_dining_rounded, c, 22 * s, Colors.white);
    });
  }

  static Future<BitmapDescriptor> _beam(double ratio) {
    const double logical = beamSize;
    return _draw(logical, logical, ratio, (Canvas canvas, double s) {
      final Offset c = Offset(logical * s / 2, logical * s / 2);
      final double r = logical * s / 2;
      const double spread = 30 * math.pi / 180;

      final Path wedge =
          Path()
            ..moveTo(c.dx, c.dy)
            ..arcTo(
              Rect.fromCircle(center: c, radius: r),
              -math.pi / 2 - spread,
              spread * 2,
              false,
            )
            ..close();
      canvas.drawPath(
        wedge,
        Paint()
          ..shader = ui.Gradient.radial(c, r, <Color>[
            AppColors.orangeDeep.withValues(alpha: 0.45),
            AppColors.orangeDeep.withValues(alpha: 0),
          ]),
      );
    });
  }

  static Future<BitmapDescriptor> _teardrop(
    IconData icon,
    Color colour,
    double width,
    double ratio,
  ) {
    final double height = width * 1.25;
    return _draw(width, height, ratio, (Canvas canvas, double s) {
      final double w = width * s;
      final double h = height * s;
      final double r = w / 2 - 3 * s;
      final Offset head = Offset(w / 2, r + 3 * s);

      final Path drop =
          Path()
            ..addOval(Rect.fromCircle(center: head, radius: r))
            ..moveTo(w / 2 - r * 0.62, head.dy + r * 0.78)
            ..quadraticBezierTo(w / 2, h - 1 * s, w / 2, h - 1 * s)
            ..quadraticBezierTo(
              w / 2,
              h - 1 * s,
              w / 2 + r * 0.62,
              head.dy + r * 0.78,
            )
            ..close();

      canvas.drawPath(
        drop.shift(Offset(0, 1.5 * s)),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.25)
          ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, 2.5 * s),
      );
      canvas.drawPath(drop, Paint()..color = colour);
      canvas.drawCircle(head, r * 0.68, Paint()..color = Colors.white);
      _glyph(canvas, icon, head, r * 0.95, colour);
    });
  }

  static void _glyph(
    Canvas canvas,
    IconData icon,
    Offset centre,
    double size,
    Color colour,
  ) {
    final TextPainter text = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: colour,
        ),
      ),
    )..layout();
    text.paint(canvas, centre - Offset(text.width / 2, text.height / 2));
  }

  static Future<BitmapDescriptor> _draw(
    double width,
    double height,
    double ratio,
    void Function(Canvas canvas, double scale) paint,
  ) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    paint(Canvas(recorder), ratio);
    final ui.Image image = await recorder.endRecording().toImage(
      (width * ratio).round(),
      (height * ratio).round(),
    );
    final ByteData? bytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return BitmapDescriptor.bytes(
      bytes!.buffer.asUint8List(),
      imagePixelRatio: ratio,
    );
  }
}
