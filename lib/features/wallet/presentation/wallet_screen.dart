import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../../auth/data/auth_user.dart';
import '../../auth/state/auth_controller.dart';
import '../../catalogue/presentation/widgets/catalogue_widgets.dart';
import '../data/payment_gateway.dart';
import '../data/wallet_models.dart';
import '../state/wallet_controller.dart';

/// The wallet: balance up top, add money in the middle, history below.
///
/// Re-reads on open and on pull, never trusting a balance from earlier in the
/// session, because a refund can land while the app is in the background.
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  /// The amounts most people add. Tapping one fills the field rather than
  /// paying straight away, so a mis-tap costs nothing.
  static const List<int> _presets = <int>[100, 200, 500, 1000];

  final TextEditingController _amount = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<WalletController>().load(),
    );
    _amount.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  double? get _entered => double.tryParse(_amount.text.trim());

  bool get _amountValid {
    final double? amount = _entered;
    return amount != null &&
        amount >= WalletController.minTopUp &&
        amount <= context.read<WalletController>().maxAddable;
  }

  Future<void> _add() async {
    final double? amount = _entered;
    if (amount == null || !_amountValid) return;
    FocusScope.of(context).unfocus();

    final AppLocalizations l10n = AppLocalizations.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final AuthUser? user = context.read<AuthController>().user;
    final WalletController wallet = context.read<WalletController>();

    final TopUpOutcome outcome = await wallet.addMoney(
          amount,
          PayerDetails(
            name: user?.name,
            email: user?.email,
            phone: user?.phone,
          ),
        );
    if (!mounted) return;

    final String? message = switch (outcome) {
      TopUpOutcome.added => l10n.walletMoneyAdded(formatRupees(amount)),
      TopUpOutcome.cancelled => null,
      TopUpOutcome.paymentFailed => l10n.walletPaymentFailed,
      TopUpOutcome.confirming => l10n.walletPaymentConfirming,
      TopUpOutcome.rejected => wallet.rejection ?? l10n.somethingWentWrong,
      TopUpOutcome.unavailable => l10n.walletTopUpUnavailable,
      TopUpOutcome.failed => l10n.somethingWentWrong,
    };
    if (outcome == TopUpOutcome.added) _amount.clear();
    if (message != null) {
      messenger
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final WalletController wallet = context.watch<WalletController>();
    final Wallet? data = wallet.wallet;
    final AuthFailure? failure = wallet.failure;
    // At the ceiling there is nothing to add; say so instead of offering a
    // field that every amount fails.
    final bool full =
        data != null && wallet.maxAddable < WalletController.minTopUp;
    final bool canAdd = data != null && !full && !wallet.isAdding;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.walletTitle)),
      body: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: wallet.load,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: <Widget>[
            _BalanceCard(
              balance: data?.balance,
              isLoading: wallet.isLoading && data == null,
            ),
            if (failure != null && data == null) ...<Widget>[
              const SizedBox(height: 16),
              _LoadFailed(
                message: failure.message(l10n),
                onRetry: wallet.isLoading ? null : wallet.load,
              ),
            ],
            const SizedBox(height: 24),
            Text(
              l10n.walletAddMoney,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            if (full) ...<Widget>[
              Text(
                l10n.walletFull(formatRupees(WalletController.maxBalance)),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
            ],
            TextField(
              controller: _amount,
              enabled: canAdd,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                prefixText: '₹ ',
                hintText: l10n.walletEnterAmount,
                helperText: l10n.walletAmountRange(
                  formatRupees(WalletController.minTopUp),
                  formatRupees(
                    full ? WalletController.maxTopUp : wallet.maxAddable,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                for (final int preset in _presets)
                  ChoiceChip(
                    label: Text('+ ${formatRupees(preset.toDouble())}'),
                    selected: _entered == preset.toDouble(),
                    onSelected: !canAdd || preset > wallet.maxAddable
                        ? null
                        : (_) => _amount.text = '$preset',
                  ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _amountValid && canAdd ? _add : null,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.greenDeep,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                ),
              ),
              child: wallet.isAdding
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _amountValid
                          ? l10n.walletAddAmount(formatRupees(_entered!))
                          : l10n.walletAddMoney,
                    ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.lock_outline_rounded,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    l10n.walletSecuredBy,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              l10n.walletHistory,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            if (data != null && data.transactions.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  l10n.walletNoHistory,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            if (data != null)
              for (final WalletTransaction entry in data.transactions)
                _TransactionRow(entry: entry),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.balance, required this.isLoading});

  final double? balance;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.walletBalance,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 6),
                if (isLoading)
                  const SizedBox(
                    height: 40,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox.square(
                        dimension: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                else
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      balance == null ? '—' : formatRupees(balance!),
                      textDirection: TextDirection.ltr,
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  l10n.walletBalanceHint,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: AppColors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({required this.entry});

  final WalletTransaction entry;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final bool credit = entry.isCredit;

    final (IconData icon, String title) = switch (entry.kind) {
      WalletEntryKind.topUp => (Icons.add_rounded, l10n.walletEntryTopUp),
      WalletEntryKind.orderPayment => (
          Icons.shopping_bag_outlined,
          entry.orderNumber == null
              ? l10n.walletEntryOrder
              : l10n.walletEntryOrderNumber(entry.orderNumber!),
        ),
      WalletEntryKind.refund => (Icons.undo_rounded, l10n.walletEntryRefund),
      WalletEntryKind.other => (
          Icons.receipt_long_outlined,
          entry.description.isEmpty ? l10n.walletTitle : entry.description,
        ),
    };
    final DateTime? at = entry.createdAt?.toLocal();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: credit
                ? AppColors.greenWash
                : theme.colorScheme.surfaceContainerHighest,
            child: Icon(
              icon,
              size: 20,
              color: credit
                  ? AppColors.greenDeep
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                if (at != null)
                  Text(
                    MaterialLocalizations.of(context).formatMediumDate(at),
                    style: theme.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          Text(
            '${credit ? '+' : '−'}${formatRupees(entry.amount.abs())}',
            textDirection: TextDirection.ltr,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: credit ? AppColors.greenDeep : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadFailed extends StatelessWidget {
  const _LoadFailed({required this.message, required this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color foreground = theme.colorScheme.error;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: foreground.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.cloud_off_rounded, size: 19, color: foreground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(color: foreground),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(foregroundColor: foreground),
            child: Text(AppLocalizations.of(context).retry),
          ),
        ],
      ),
    );
  }
}
