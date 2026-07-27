import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

/// The square "N + pin" mark, clipped to a rounded tile.
///
/// The source artwork carries its own black backdrop, so the tile is filled
/// with the same black to keep the edges clean in both themes.
class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 48, this.radius = 14});

  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AppAssets.mark,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
