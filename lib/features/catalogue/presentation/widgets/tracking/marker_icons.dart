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
    required this.home,
    required this.shop,
  });

  /// The rider seen from above: scooter, rider and delivery box, nose
  /// pointing north. Drawn flat and rotated to the direction of travel, so
  /// the customer sees which way the bike is facing, the way ride apps show
  /// their captains.
  final BitmapDescriptor rider;

  /// The delivery point: a pin with a label beside it.
  final BitmapDescriptor home;

  /// The restaurant: a smaller pin with its name beside it.
  final BitmapDescriptor shop;

  /// Paints all three. Also returns where each labelled pin's tip sits in its
  /// bitmap, as the marker anchors for home and shop.
  static Future<(TrackingMarkerIcons, Offset, Offset)> paint(
    double ratio, {
    required String homeLabel,
    String? shopLabel,
  }) async {
    final (BitmapDescriptor, Offset) home = await _labelledPin(
      icon: Icons.home_rounded,
      colour: AppColors.greenDeep,
      label: homeLabel,
      pinWidth: 40,
      ratio: ratio,
    );
    final (BitmapDescriptor, Offset) shop = await _labelledPin(
      icon: Icons.restaurant_rounded,
      colour: AppColors.orangeDeep,
      label: shopLabel,
      pinWidth: 34,
      ratio: ratio,
    );
    return (
      TrackingMarkerIcons(
        rider: await _scooter(ratio),
        home: home.$1,
        shop: shop.$1,
      ),
      home.$2,
      shop.$2,
    );
  }

  /// A delivery scooter from directly above, 36 x 68 dp, front at the top.
  static Future<BitmapDescriptor> _scooter(double ratio) {
    const double w = 36;
    const double h = 68;
    return _draw(w, h, ratio, (Canvas canvas, double s) {
      final double cx = w * s / 2;
      RRect rr(double x, double y, double width, double height, double r) =>
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(cx + x * s, y * s),
              width: width * s,
              height: height * s,
            ),
            Radius.circular(r * s),
          );

      // Ground shadow, offset a little so the bike reads as on the road.
      canvas.drawRRect(
        rr(1.5, 36, 24, 60, 12),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.28)
          ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, 3 * s),
      );

      final Paint tyre = Paint()..color = const Color(0xFF1C1C1C);
      final Paint body = Paint()..color = const Color(0xFF2B2E33);
      final Paint trim = Paint()..color = const Color(0xFF4A4F57);

      // Wheels, front and back.
      canvas.drawRRect(rr(0, 9, 6, 13, 3), tyre);
      canvas.drawRRect(rr(0, 60, 6.5, 12, 3), tyre);

      // Front apron and headlight.
      canvas.drawRRect(rr(0, 14, 14, 12, 6), body);
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx, 8.5 * s), width: 6 * s, height: 3 * s),
        Paint()..color = const Color(0xFFFFE9A8),
      );

      // Handlebar with mirrors.
      final Paint bar = Paint()
        ..color = const Color(0xFF1C1C1C)
        ..strokeWidth = 2.6 * s
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(cx - 12 * s, 19 * s), Offset(cx + 12 * s, 19 * s), bar);
      canvas.drawCircle(Offset(cx - 13 * s, 16.5 * s), 2 * s, trim);
      canvas.drawCircle(Offset(cx + 13 * s, 16.5 * s), 2 * s, trim);

      // Footboard and seat.
      canvas.drawRRect(rr(0, 38, 16, 30, 6), body);
      canvas.drawRRect(rr(0, 40, 10, 16, 5), trim);

      // The rider: arms to the bars, shoulders in the brand orange, helmet.
      final Paint arm = Paint()
        ..color = AppColors.orangeDeep
        ..strokeWidth = 3.4 * s
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(cx - 9 * s, 30 * s), Offset(cx - 10.5 * s, 20 * s), arm);
      canvas.drawLine(Offset(cx + 9 * s, 30 * s), Offset(cx + 10.5 * s, 20 * s), arm);
      canvas.drawRRect(
        rr(0, 33, 22, 11, 5.5),
        Paint()
          ..shader = ui.Gradient.linear(
            Offset(cx, 28 * s),
            Offset(cx, 38 * s),
            const <Color>[AppColors.orangeLight, AppColors.orangeDeep],
          ),
      );
      canvas.drawCircle(
        Offset(cx, 30 * s),
        6.4 * s,
        Paint()..color = const Color(0xFF16181B),
      );
      // Visor, facing forward, and a highlight so the helmet reads as round.
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, 30 * s), radius: 5 * s),
        3.6,
        2.2,
        false,
        Paint()
          ..color = const Color(0xFF6FA8DC)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2 * s,
      );
      canvas.drawCircle(
        Offset(cx - 2 * s, 28 * s),
        1.4 * s,
        Paint()..color = Colors.white.withValues(alpha: 0.55),
      );

      // The delivery box on the back, in brand orange with a white band.
      canvas.drawRRect(rr(0, 54, 22, 18, 3.5), Paint()..color = AppColors.orangeDeep);
      canvas.drawRRect(
        rr(0, 54, 22, 18, 3.5),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.9)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4 * s,
      );
      canvas.drawLine(
        Offset(cx - 11 * s, 54 * s),
        Offset(cx + 11 * s, 54 * s),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.9)
          ..strokeWidth = 1.4 * s,
      );
    });
  }

  /// A teardrop pin with an optional label chip to its right, the way the
  /// reference apps tag "Pickup" and the restaurant's name on the map.
  ///
  /// Returns the bitmap and where the pin's tip sits in it, for the anchor.
  static Future<(BitmapDescriptor, Offset)> _labelledPin({
    required IconData icon,
    required Color colour,
    required String? label,
    required double pinWidth,
    required double ratio,
  }) async {
    final double pinHeight = pinWidth * 1.25;
    final String text = (label ?? '').trim();
    final TextPainter labelText = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '…',
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF14170F),
        ),
      ),
    )..layout(maxWidth: 150);

    const double gap = 4;
    const double chipPadX = 10;
    const double chipHeight = 28;
    final double chipWidth = text.isEmpty ? 0 : labelText.width + chipPadX * 2;
    final double width = pinWidth + (text.isEmpty ? 0 : gap + chipWidth + 4);
    final double height = pinHeight + 2;

    final BitmapDescriptor bitmap =
        await _draw(width, height, ratio, (Canvas canvas, double s) {
      final double r = (pinWidth / 2 - 3) * s;
      final Offset head = Offset(pinWidth * s / 2, r + 3 * s);
      final double tip = (pinHeight - 1) * s;

      final Path drop = Path()
        ..addOval(Rect.fromCircle(center: head, radius: r))
        ..moveTo(head.dx - r * 0.62, head.dy + r * 0.78)
        ..lineTo(head.dx, tip)
        ..lineTo(head.dx + r * 0.62, head.dy + r * 0.78)
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

      if (text.isEmpty) return;
      final Rect chip = Rect.fromLTWH(
        (pinWidth + gap) * s,
        head.dy - chipHeight * s / 2,
        chipWidth * s,
        chipHeight * s,
      );
      final RRect pill =
          RRect.fromRectAndRadius(chip, Radius.circular(chipHeight * s / 2));
      canvas.drawRRect(
        pill.shift(Offset(0, 1.5 * s)),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.18)
          ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, 3 * s),
      );
      canvas.drawRRect(pill, Paint()..color = Colors.white);
      canvas.save();
      canvas.translate(chip.left + chipPadX * s, chip.center.dy);
      canvas.scale(s);
      labelText.paint(canvas, Offset(0, -labelText.height / 2));
      canvas.restore();
    });

    return (bitmap, Offset((pinWidth / 2) / width, (pinHeight - 1) / height));
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
    final ui.Image image = await recorder
        .endRecording()
        .toImage((width * ratio).round(), (height * ratio).round());
    final ByteData? bytes =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(
      bytes!.buffer.asUint8List(),
      imagePixelRatio: ratio,
    );
  }
}
