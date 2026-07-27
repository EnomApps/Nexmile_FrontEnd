import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/localization/app_language.dart';
import '../../core/localization/locale_controller.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/brand_mark.dart';
import '../../core/widgets/gradient_button.dart';
import '../../generated/l10n/app_localizations.dart';

/// Landing screen after language selection.
///
/// Deliberately minimal — it exists to prove the chosen locale is live across
/// the app and to give the language screen a way back in. Feature surfaces
/// (catalogue, cart, tracking) plug in here.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AppLanguage language = context.watch<LocaleController>().language;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: <Widget>[
            const BrandMark(size: 36, radius: 11),
            const SizedBox(width: 10),
            Text(
              l10n.appName,
              textDirection: TextDirection.ltr,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.language,
              arguments: false,
            ),
            icon: const Icon(Icons.translate_rounded),
            tooltip: l10n.changeLanguage,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          const BrandRule(width: 56, height: 4),
          const SizedBox(height: 16),
          Text(l10n.homeTitle, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(l10n.homeSubtitle, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 28),
          _LanguageCard(language: language, l10n: l10n),
          const SizedBox(height: 24),
          GradientButton(
            label: l10n.changeLanguage,
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.language,
              arguments: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({required this.language, required this.l10n});

  final AppLanguage language;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.greenGradient,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.translate_rounded,
              color: AppColors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  l10n.appLanguageLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Directionality(
                  textDirection: language.textDirection,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        language.nativeName,
                        maxLines: 1,
                        softWrap: false,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? AppColors.greenLight
                              : AppColors.greenDeep,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
