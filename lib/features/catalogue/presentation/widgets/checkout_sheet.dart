import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../../address/data/address.dart';
import '../../../address/state/address_controller.dart';
import '../../../auth/data/auth_failure.dart';
import '../../data/cart_models.dart';
import '../../data/order_models.dart';
import '../../state/cart_controller.dart';
import 'catalogue_widgets.dart';

/// Confirms fulfilment, address and payment, then places the order.
///
/// Returns the placed [Order], or null if the customer backed out.
Future<Order?> showCheckoutSheet({
  required BuildContext context,
  required Cart cart,
  required String restaurantId,
}) {
  return showModalBottomSheet<Order>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (BuildContext context) =>
        _CheckoutSheet(cart: cart, restaurantId: restaurantId),
  );
}

class _CheckoutSheet extends StatefulWidget {
  const _CheckoutSheet({required this.cart, required this.restaurantId});

  final Cart cart;
  final String restaurantId;

  @override
  State<_CheckoutSheet> createState() => _CheckoutSheetState();
}

class _CheckoutSheetState extends State<_CheckoutSheet> {
  /// The API documents cash on delivery as the only method for now, so this is
  /// shown as a fact rather than offered as a choice.
  static const String _paymentMethod = 'cod';

  final TextEditingController _note = TextEditingController();

  late FulfilmentType _fulfilment = widget.cart.fulfilmentType;
  int? _addressId;

  @override
  void initState() {
    super.initState();
    _addressId = context.read<AddressController>().defaultAddress?.id;
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickAddress() async {
    final List<Address> addresses = context.read<AddressController>().addresses;
    final AppLocalizations l10n = AppLocalizations.of(context);

    final int? chosen = await showModalBottomSheet<int>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (BuildContext context) => ListView(
        shrinkWrap: true,
        children: <Widget>[
          for (final Address address in addresses)
            RadioListTile<int>(
              value: address.id,
              groupValue: _addressId,
              onChanged: (int? value) => Navigator.of(context).pop(value),
              title: Text(address.label.name),
              subtitle: Text(address.summary),
            ),
          ListTile(
            leading: const Icon(Icons.add_location_alt_outlined),
            title: Text(l10n.addAddress),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(
                AppRoutes.locationPermission,
                arguments: const LocationPermissionArgs(isFirstAddress: false),
              );
            },
          ),
        ],
      ),
    );

    if (chosen != null && mounted) setState(() => _addressId = chosen);
  }

  Future<void> _placeOrder() async {
    final CartController cart = context.read<CartController>();
    final (Order? order, AuthFailure? failure) = await cart.checkout(
      widget.restaurantId,
      fulfilmentType: _fulfilment,
      paymentMethod: _paymentMethod,
      addressId: _fulfilment == FulfilmentType.delivery ? _addressId : null,
    // The note is per-order rather than per-item, and reaches the kitchen.
      note: _note.text,
    );

    if (!mounted) return;
    if (order != null) {
      Navigator.of(context).pop(order);
      return;
    }

    // Everything is re-checked server-side at this point — availability, hours,
    // the 1 km radius, the minimum — so the server's own wording is the most
    // accurate thing to show.
    final AppLocalizations l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            cart.firstError() ?? (failure ?? AuthFailure.unknown).message(l10n),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController controller = context.watch<CartController>();
    final Cart cart = controller.cart ?? widget.cart;

    final Address? address = context
        .watch<AddressController>()
        .addresses
        .cast<Address?>()
        .firstWhere((Address? a) => a?.id == _addressId, orElse: () => null);

    final bool needsAddress =
        _fulfilment == FulfilmentType.delivery && address == null;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.checkoutTitle,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              children: <Widget>[
                if (cart.restaurant.supportsPickup) ...<Widget>[
                  SegmentedButton<FulfilmentType>(
                    segments: <ButtonSegment<FulfilmentType>>[
                      ButtonSegment<FulfilmentType>(
                        value: FulfilmentType.delivery,
                        label: Text(
                          l10n.deliveryLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        icon: const Icon(Icons.delivery_dining_rounded),
                      ),
                      ButtonSegment<FulfilmentType>(
                        value: FulfilmentType.pickup,
                        label: Text(
                          l10n.pickupLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        icon: const Icon(Icons.storefront_rounded),
                      ),
                    ],
                    selected: <FulfilmentType>{_fulfilment},
                    onSelectionChanged: (Set<FulfilmentType> value) =>
                        setState(() => _fulfilment = value.first),
                  ),
                  const SizedBox(height: 20),
                ],
                if (_fulfilment == FulfilmentType.delivery) ...<Widget>[
                  _Block(
                    icon: Icons.location_on_outlined,
                    title: l10n.deliveryAddressLabel,
                    body: address?.summary ?? l10n.noAddressSelected,
                    trailing: TextButton(
                      onPressed: _pickAddress,
                      child: Text(address == null ? l10n.addLabel : l10n.editLabel),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                _Block(
                  icon: Icons.payments_outlined,
                  title: l10n.paymentMethodLabel,
                  body: l10n.payOnDelivery,
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.noteToRestaurant,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _note,
                  maxLength: 200,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: l10n.noteToRestaurantHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                BillRow(label: l10n.itemTotal, amount: cart.totals.itemsTotal),
                if (cart.totals.packagingFee > 0)
                  BillRow(
                    label: l10n.packagingLabel,
                    amount: cart.totals.packagingFee,
                  ),
                if (_fulfilment == FulfilmentType.delivery)
                  BillRow(
                    label: l10n.deliveryFeeLabel,
                    amount: cart.totals.deliveryFee,
                    freeLabel: cart.freeDeliveryApplied ||
                            cart.totals.deliveryFee == 0
                        ? l10n.freeLabel
                        : null,
                  ),
                if (cart.totals.discountTotal > 0)
                  BillRow(
                    label: l10n.discountLabel,
                    amount: -cart.totals.discountTotal,
                    highlight: true,
                  ),
                if (cart.totals.taxTotal > 0)
                  BillRow(
                    label: l10n.taxesAndCharges,
                    amount: cart.totals.taxTotal,
                  ),
                const Divider(height: 20),
                BillRow(
                  label: l10n.toPay,
                  amount: cart.totals.grandTotal,
                  emphasis: true,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: SafeArea(
              top: false,
              child: FilledButton(
                onPressed:
                    controller.isMutating || needsAddress ? null : _placeOrder,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.greenDeep,
                  minimumSize: const Size.fromHeight(52),
                ),
                child: controller.isMutating
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          l10n.placeOrderFor(
                            formatRupees(cart.totals.grandTotal),
                          ),
                          maxLines: 1,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block({
    required this.icon,
    required this.title,
    required this.body,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
          Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(body, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
