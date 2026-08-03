import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/localization/app_language.dart';
import '../../core/localization/locale_controller.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/brand_mark.dart';
import '../../core/widgets/info_tile.dart';
import '../../generated/l10n/app_localizations.dart';
import '../auth/data/auth_user.dart';
import '../auth/state/auth_controller.dart';

/// Landing screen after a successful sign-in.
///
/// Intentionally a shell: it proves the session and the chosen locale are live
/// across the app, and gives the profile and language screens a home. The
/// catalogue, cart and order-tracking surfaces plug in here.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AppLanguage language = context.watch<LocaleController>().language;
    final AuthUser? user = context.watch<AuthController>().user;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const BrandMark(size: 36, radius: 11),
            const SizedBox(width: 10),
            // Flexible, not bare: with action buttons and a large system font
            // on a narrow phone the title is what has to give.
            Flexible(
              child: Text(
                l10n.appName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.profile),
            icon: const Icon(Icons.person_outline_rounded),
            tooltip: l10n.profileTitle,
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          if (user != null) ...<Widget>[
            Text(
              l10n.greetingNamed(user.firstName),
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(l10n.homeTitle, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(l10n.homeSubtitle, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 26),
          if (user != null) ...<Widget>[
            _AccountCard(
              user: user,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.profile),
            ),
            const SizedBox(height: 12),
          ],
          InfoTile(
            icon: Icons.person_outline_rounded,
            label: l10n.profileTitle,
            value: l10n.viewProfile,
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.profile),
          ),
          const SizedBox(height: 12),
          InfoTile(
            icon: Icons.translate_rounded,
            label: l10n.appLanguageLabel,
            value: language.nativeName,
            valueDirection: language.textDirection,
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.language,
              arguments: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({required this.user, required this.onTap});

  final AuthUser user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final BorderRadius radius = BorderRadius.circular(AppTheme.radiusLarge);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: AppColors.greenGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    user.firstName.isEmpty
                        ? '?'
                        : user.firstName.characters.first.toUpperCase(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        // Whichever identifier the customer signed in with —
                        // the API populates only one of the two.
                        user.email ?? user.phone ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
