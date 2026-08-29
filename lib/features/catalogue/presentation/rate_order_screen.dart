import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../data/order_models.dart';
import '../data/storefront_repository.dart';
import 'widgets/catalogue_widgets.dart';

/// Rate a finished order: the shop once, and any dish the customer feels
/// strongly enough about to tap.
class RateOrderScreen extends StatefulWidget {
  const RateOrderScreen({super.key, required this.args});

  final RateOrderArgs args;

  @override
  State<RateOrderScreen> createState() => _RateOrderScreenState();
}

class _RateOrderScreenState extends State<RateOrderScreen> {
  final TextEditingController _comment = TextEditingController();

  int _rating = 0;

  /// Menu item id to stars. Only what the customer actually rated is sent —
  /// an untouched dish is not a one-star dish.
  final Map<int, int> _dishes = <int, int>{};

  bool _isSending = false;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  /// The lines that can carry a rating.
  ///
  /// A rating is keyed by menu item, and `GET /v1/orders` does not send that
  /// id on every line yet. Rather than guess from the line id — which would
  /// rate whatever dish happened to share the number — those lines simply do
  /// not offer stars, and the overall rating still goes through.
  List<OrderItem> get _rateable => widget.args.order.items
      .where((OrderItem i) => i.menuItemId != null)
      .toList(growable: false);

  Future<void> _submit() async {
    if (_rating == 0 || _isSending) return;
    setState(() => _isSending = true);

    final AppLocalizations l10n = AppLocalizations.of(context);
    final NavigatorState navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    try {
      await context.read<StorefrontRepository>().reviewOrder(
            widget.args.order.id,
            rating: _rating,
            comment: _comment.text,
            dishes: _dishes,
          );
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(l10n.reviewThanks)));
      navigator.pop(true);
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() => _isSending = false);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            authFailureFrom(error, validationFailure: AuthFailure.unknown)
                .message(l10n),
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _isSending = false);
      messenger.showSnackBar(
        SnackBar(content: Text(AuthFailure.unknown.message(l10n))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<OrderItem> rateable = _rateable;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.rateOrderTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        children: <Widget>[
          if (widget.args.order.restaurantName != null)
            Text(
              widget.args.order.restaurantName!,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          const SizedBox(height: 16),
          Center(
            child: _StarPicker(
              value: _rating,
              size: 44,
              onChanged: (int value) => setState(() => _rating = value),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _comment,
            minLines: 3,
            maxLines: 5,
            maxLength: 500,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              hintText: l10n.reviewHint,
              border: const OutlineInputBorder(),
            ),
          ),
          if (rateable.isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            SectionHeader(title: l10n.rateDishesTitle),
            for (final OrderItem item in rateable)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: <Widget>[
                    VegMark(isVeg: item.isVeg),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    _StarPicker(
                      value: _dishes[item.menuItemId!] ?? 0,
                      size: 26,
                      onChanged: (int value) => setState(
                        () => _dishes[item.menuItemId!] = value,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: FilledButton(
            // The overall rating is the one thing the API requires, so the
            // button waits for it rather than failing at the server.
            onPressed: _rating == 0 || _isSending ? null : _submit,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.greenDeep,
              minimumSize: const Size.fromHeight(52),
            ),
            child: _isSending
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: Colors.white,
                    ),
                  )
                : Text(l10n.submitRating),
          ),
        ),
      ),
    );
  }
}

/// Five tappable stars. Tapping the star already chosen clears it, so a rating
/// given by accident is not a rating the customer is stuck with.
class _StarPicker extends StatelessWidget {
  const _StarPicker({
    required this.value,
    required this.onChanged,
    this.size = 32,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // A scale, not text: it runs the same way in Urdu as in Tamil.
      textDirection: TextDirection.ltr,
      children: <Widget>[
        for (int star = 1; star <= 5; star++)
          Semantics(
            button: true,
            selected: star <= value,
            child: InkResponse(
              onTap: () => onChanged(star == value ? 0 : star),
              radius: size * 0.7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  star <= value ? Icons.star_rounded : Icons.star_outline_rounded,
                  size: size,
                  color: star <= value
                      ? const Color(0xFFF5A623)
                      : Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
