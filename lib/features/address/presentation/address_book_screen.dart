import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/info_tile.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../catalogue/presentation/widgets/catalogue_widgets.dart';
import '../data/address.dart';
import '../state/address_controller.dart';

/// Saved delivery addresses: set a default, edit the pin, or delete.
class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<AddressController>().load(),
    );
  }

  void _addAddress() {
    Navigator.of(context).pushNamed(
      AppRoutes.locationPermission,
      arguments: const LocationPermissionArgs(isFirstAddress: false),
    );
  }

  /// Re-reads the address before editing, so a copy changed on another device
  /// does not get overwritten with what this device last saw.
  Future<void> _editAddress(Address address) async {
    final NavigatorState navigator = Navigator.of(context);
    final Address? fresh =
        await context.read<AddressController>().fetch(address.id);
    if (!mounted) return;

    navigator.pushNamed(
      AppRoutes.addressMap,
      arguments: AddressMapArgs(
        editing: fresh ?? address,
        isFirstAddress: false,
      ),
    );
  }

  Future<void> _confirmDelete(Address address) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AddressController controller = context.read<AddressController>();

    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(l10n.deleteAddressTitle),
        content: Text(l10n.deleteAddressMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancelLabel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(l10n.deleteLabel),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    await controller.delete(address.id);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AddressController controller = context.watch<AddressController>();
    final List<Address> addresses = controller.addresses;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addressBookTitle),
        actions: <Widget>[
          if (controller.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2.2),
                ),
              ),
            ),
          const SizedBox(width: 4),
        ],
      ),
      body: addresses.isEmpty && controller.hasLoaded
          ? EmptyState(
              emoji: '📍',
              title: l10n.noAddressesTitle,
              subtitle: l10n.noAddressesSubtitle,
              action: OutlinedButton.icon(
                onPressed: _addAddress,
                icon: const Icon(Icons.add_location_alt_outlined, size: 20),
                label: Text(l10n.addAddress),
              ),
            )
          : RefreshIndicator(
              onRefresh: () => context.read<AddressController>().load(),
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
                itemCount: addresses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (BuildContext context, int index) => _AddressCard(
                  address: addresses[index],
                  onMakeDefault: () => context
                      .read<AddressController>()
                      .makeDefault(addresses[index].id),
                  onEdit: () => _editAddress(addresses[index]),
                  onDelete: () => _confirmDelete(addresses[index]),
                ),
              ),
            ),
      floatingActionButton: addresses.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: _addAddress,
              icon: const Icon(Icons.add_location_alt_outlined),
              label: Text(l10n.addAddress),
            ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard({
    required this.address,
    required this.onMakeDefault,
    required this.onEdit,
    required this.onDelete,
  });

  final Address address;
  final VoidCallback onMakeDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color accent = isDark ? AppColors.greenLight : AppColors.greenDeep;

    final (IconData icon, String label) = switch (address.label) {
      AddressLabel.home => (Icons.home_rounded, l10n.labelHome),
      AddressLabel.work => (Icons.work_outline_rounded, l10n.labelWork),
      AddressLabel.other => (Icons.place_outlined, l10n.labelOther),
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(
          color: address.isDefault ? accent : theme.colorScheme.outline,
          width: address.isDefault ? 1.8 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, size: 20, color: accent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (address.isDefault)
                StatusChip(
                  label: l10n.defaultLabel,
                  tone: StatusTone.positive,
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            address.summary,
            style: theme.textTheme.bodyMedium,
          ),
          if ((address.contactPhone ?? '').isNotEmpty) ...<Widget>[
            const SizedBox(height: 6),
            Text(
              address.contactPhone!,
              textDirection: TextDirection.ltr,
              style: theme.textTheme.bodySmall,
            ),
          ],
          const Divider(height: 24),
          // Wrap so two translated actions never collide on a narrow phone.
          Wrap(
            spacing: 4,
            children: <Widget>[
              if (!address.isDefault)
                TextButton.icon(
                  onPressed: onMakeDefault,
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
                  label: Text(l10n.setAsDefault),
                  style: TextButton.styleFrom(foregroundColor: accent),
                ),
              TextButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: Text(l10n.editLabel),
              ),
              TextButton.icon(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline_rounded, size: 18),
                label: Text(l10n.deleteLabel),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
