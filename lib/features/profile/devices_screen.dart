import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_router.dart';
import '../../core/theme/app_theme.dart';
import '../../generated/l10n/app_localizations.dart';
import '../auth/data/auth_failure.dart';
import '../auth/data/device_session.dart';
import '../auth/state/auth_controller.dart';
import '../catalogue/presentation/widgets/catalogue_widgets.dart';

/// "Where am I signed in" — every device holding a live refresh token.
///
/// The API gives no `is_current` flag, so this screen cannot mark which row is
/// this phone. Rather than guess from the device name and risk telling someone
/// they are revoking a different device than they are, revoking any row warns
/// that it may be this one.
class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  List<DeviceSession> _sessions = <DeviceSession>[];
  AuthFailure? _failure;
  bool _isLoading = true;
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    final (List<DeviceSession> sessions, AuthFailure? failure) =
        await context.read<AuthController>().sessions();
    if (!mounted) return;
    setState(() {
      _sessions = sessions;
      _failure = failure;
      _isLoading = false;
    });
  }

  Future<void> _revoke(DeviceSession session) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AuthController auth = context.read<AuthController>();
    final NavigatorState navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    final bool confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(l10n.signOutDeviceTitle),
            content: Text(l10n.signOutDeviceMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.cancelLabel),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.signOutDevice),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed || !mounted) return;

    setState(() => _isBusy = true);
    final AuthFailure? failure = await auth.revokeSession(session.id);
    if (!mounted) return;
    setState(() => _isBusy = false);

    if (failure != null) {
      messenger
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(failure.message(l10n))));
      return;
    }

    // Revoking the token this app is holding logs it out on the next call, so
    // check rather than leaving a dead session on screen.
    if (!auth.isSignedIn) {
      navigator.pushNamedAndRemoveUntil(
        AppRoutes.login,
        (Route<void> route) => false,
      );
      return;
    }

    messenger
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(l10n.deviceSignedOut)));
    await _load();
  }

  Future<void> _signOutEverywhere() async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AuthController auth = context.read<AuthController>();
    final NavigatorState navigator = Navigator.of(context);

    final bool confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(l10n.signOutEverywhereTitle),
            content: Text(l10n.signOutEverywhereMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.cancelLabel),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.signOutEverywhere),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed || !mounted) return;

    setState(() => _isBusy = true);
    // This device is included, so there is nothing to come back to.
    await auth.signOutEverywhere();
    if (!mounted) return;
    navigator.pushNamedAndRemoveUntil(
      AppRoutes.login,
      (Route<void> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.devicesTitle)),
      body: RefreshIndicator(
        onRefresh: _load,
        child: Builder(
          builder: (BuildContext context) {
            if (_isLoading && _sessions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_failure != null && _sessions.isEmpty) {
              return ListView(
                children: <Widget>[
                  EmptyState(
                    emoji: '📡',
                    title: l10n.somethingWentWrong,
                    subtitle: _failure!.message(l10n),
                    action: OutlinedButton(
                      onPressed: _load,
                      child: Text(l10n.retry),
                    ),
                  ),
                ],
              );
            }
            if (_sessions.isEmpty) {
              return ListView(
                children: <Widget>[
                  EmptyState(
                    emoji: '📱',
                    title: l10n.devicesEmptyTitle,
                    subtitle: l10n.devicesEmptySubtitle,
                  ),
                ],
              );
            }

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              children: <Widget>[
                Text(l10n.devicesSubtitle, style: theme.textTheme.bodySmall),
                const SizedBox(height: 16),
                for (final DeviceSession session in _sessions) ...<Widget>[
                  _SessionTile(
                    session: session,
                    onRevoke: _isBusy ? null : () => _revoke(session),
                  ),
                  const SizedBox(height: 12),
                ],
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: _isBusy ? null : _signOutEverywhere,
                  icon: const Icon(Icons.logout_rounded, size: 20),
                  label: Text(l10n.signOutEverywhere),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    foregroundColor: theme.colorScheme.error,
                    side: BorderSide(
                      color: theme.colorScheme.error.withValues(alpha: 0.45),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radius),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session, required this.onRevoke});

  final DeviceSession session;
  final VoidCallback? onRevoke;

  /// Coarse and honest. An exact timestamp on a "last used" row invites the
  /// customer to reason about minutes they cannot verify.
  String _lastUsed(AppLocalizations l10n) {
    final DateTime? at = session.lastUsedAt;
    if (at == null) return l10n.notProvided;
    final Duration ago = DateTime.now().difference(at);
    if (ago.inMinutes < 2) return l10n.activeNow;
    if (ago.inHours < 1) return l10n.minutesAgo(ago.inMinutes);
    if (ago.inDays < 1) return l10n.hoursAgo(ago.inHours);
    return l10n.daysAgo(ago.inDays);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String name = (session.deviceName ?? '').trim().isEmpty
        ? l10n.unknownDevice
        : session.deviceName!.trim();

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.phone_android_rounded,
            size: 22,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(_lastUsed(l10n), style: theme.textTheme.bodySmall),
                if ((session.ipAddress ?? '').isNotEmpty) ...<Widget>[
                  const SizedBox(height: 2),
                  Text(
                    session.ipAddress!,
                    // An IP address reads left to right in every language.
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: onRevoke,
            icon: const Icon(Icons.logout_rounded),
            color: theme.colorScheme.error,
            tooltip: l10n.signOutDevice,
          ),
        ],
      ),
    );
  }
}
