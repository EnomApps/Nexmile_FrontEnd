import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../../auth/presentation/widgets/auth_scaffold.dart';
import '../../auth/presentation/widgets/auth_text_field.dart';
import '../data/address.dart';
import '../data/location_service.dart';
import '../state/address_controller.dart';

/// The rest of the address, once the pin is set.
///
/// Coordinates arrive from the map and are never editable here — the API makes
/// them mandatory and computes the 1 km radius from them, so they belong to the
/// map step, not to a text field a customer could mistype.
class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({super.key, required this.args});

  final AddressFormArgs args;

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _line1;
  late final TextEditingController _line2;
  late final TextEditingController _landmark;
  late final TextEditingController _city;
  late final TextEditingController _state;
  late final TextEditingController _pincode;
  late final TextEditingController _contactName;
  late final TextEditingController _contactPhone;

  AddressLabel _label = AddressLabel.home;
  bool _isDefault = true;
  AuthFailure? _failure;

  @override
  void initState() {
    super.initState();
    final Address? editing = widget.args.editing;
    final ResolvedPlace? p = widget.args.prefill;

    // Editing wins over geocoding: what the customer typed last time beats
    // whatever the geocoder makes of the pin. Reverse geocoding is only a head
    // start for a new address, and every field stays editable either way,
    // because Indian addresses routinely need a flat number and a landmark
    // that no geocoder knows about.
    _line1 = TextEditingController(text: editing?.line1 ?? p?.line1 ?? '');
    _line2 = TextEditingController(text: editing?.line2 ?? '');
    _landmark =
        TextEditingController(text: editing?.landmark ?? p?.landmark ?? '');
    _city = TextEditingController(text: editing?.city ?? p?.city ?? '');
    _state = TextEditingController(text: editing?.state ?? p?.state ?? '');
    _pincode =
        TextEditingController(text: editing?.pincode ?? p?.pincode ?? '');
    _contactName = TextEditingController(text: editing?.contactName ?? '');
    _contactPhone = TextEditingController(text: editing?.contactPhone ?? '');

    if (editing != null) {
      _label = editing.label;
      _isDefault = editing.isDefault;
    }
  }

  @override
  void dispose() {
    for (final TextEditingController c in <TextEditingController>[
      _line1,
      _line2,
      _landmark,
      _city,
      _state,
      _pincode,
      _contactName,
      _contactPhone,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();
    setState(() => _failure = null);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final NavigatorState navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AddressController controller = context.read<AddressController>();

    final Address? editing = widget.args.editing;
    final AuthFailure? failure = await controller.save(
      id: editing?.id,
      AddressDraft(
        label: _label,
        line1: _line1.text,
        line2: _line2.text,
        landmark: _landmark.text,
        city: _city.text,
        state: _state.text,
        pincode: _pincode.text,
        latitude: widget.args.latitude,
        longitude: widget.args.longitude,
        contactName: _contactName.text,
        contactPhone: _contactPhone.text,
        isDefault: _isDefault,
      ),
    );

    if (!mounted) return;
    if (failure != null) {
      setState(() => _failure = failure);
      // Re-run validation so a 422's field errors render under their own
      // inputs. Validators do not re-fire on their own after a failed submit,
      // so without this the server's "we don't deliver to this pincode"
      // would be collected and never shown.
      _formKey.currentState?.validate();
      return;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            editing == null ? l10n.addressSaved : l10n.addressUpdated,
          ),
        ),
      );

    if (editing != null) {
      // Correcting an address: unwind the map back to the book.
      navigator.popUntil(
        (Route<void> route) => route.settings.name == AppRoutes.addressBook,
      );
      return;
    }

    if (widget.args.isFirstAddress) {
      // Onboarding: this was the last step before the storefront.
      navigator.pushNamedAndRemoveUntil(
        AppRoutes.dashboard,
        (Route<void> route) => false,
      );
    } else {
      navigator.popUntil((Route<void> route) => route.isFirst);
      navigator.pushNamed(AppRoutes.addressBook);
    }
  }

  /// Server-side field errors take priority over the local rule, because the
  /// backend knows things the client cannot (a pincode outside a served zone).
  String? _serverError(String field) =>
      context.read<AddressController>().fieldErrors[field]?.first;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isBusy = context.watch<AddressController>().isLoading;

    return AuthScaffold(
      title: l10n.addressDetailsTitle,
      subtitle: l10n.addressDetailsSubtitle,
      children: <Widget>[
        _PinnedCoordinates(
          latitude: widget.args.latitude,
          longitude: widget.args.longitude,
          onEdit: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 22),
        _LabelPicker(
          value: _label,
          onChanged: (AddressLabel v) => setState(() => _label = v),
        ),
        const SizedBox(height: 22),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AuthTextField(
                label: l10n.addressLine1Label,
                controller: _line1,
                hint: l10n.addressLine1Hint,
                prefixIcon: Icons.home_outlined,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
                validator: (String? v) =>
                    _serverError('line1') ??
                    ((v ?? '').trim().isEmpty ? l10n.fieldRequired : null),
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.addressLine2Label,
                controller: _line2,
                hint: l10n.addressLine2Hint,
                prefixIcon: Icons.apartment_outlined,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.landmarkLabel,
                controller: _landmark,
                hint: l10n.landmarkHint,
                prefixIcon: Icons.signpost_outlined,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.cityLabel,
                controller: _city,
                prefixIcon: Icons.location_city_outlined,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
                validator: (String? v) =>
                    _serverError('city') ??
                    ((v ?? '').trim().isEmpty ? l10n.fieldRequired : null),
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.stateLabel,
                controller: _state,
                prefixIcon: Icons.map_outlined,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
                validator: (String? v) =>
                    _serverError('state') ??
                    ((v ?? '').trim().isEmpty ? l10n.fieldRequired : null),
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.pincodeLabel,
                controller: _pincode,
                hint: '600040',
                prefixIcon: Icons.markunread_mailbox_outlined,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLength: 6,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                enabled: !isBusy,
                validator: (String? v) {
                  final String? server = _serverError('pincode');
                  if (server != null) return server;
                  final String value = (v ?? '').trim();
                  if (value.isEmpty) return l10n.fieldRequired;
                  // Matches the API's ^[1-9]\d{5}$.
                  if (!RegExp(r'^[1-9]\d{5}$').hasMatch(value)) {
                    return l10n.invalidPincode;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.contactNameLabel,
                controller: _contactName,
                prefixIcon: Icons.person_outline_rounded,
                textInputAction: TextInputAction.next,
                enabled: !isBusy,
                forceLtrInput: false,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                label: l10n.contactPhoneLabel,
                controller: _contactPhone,
                hint: '9876543210',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                maxLength: 10,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                enabled: !isBusy,
                validator: (String? v) {
                  final String? server = _serverError('contact_phone');
                  if (server != null) return server;
                  final String value = (v ?? '').trim();
                  // Optional, but must be valid when given.
                  if (value.isEmpty) return null;
                  return RegExp(r'^[6-9]\d{9}$').hasMatch(value)
                      ? null
                      : l10n.invalidMobileNumber;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SwitchListTile.adaptive(
          value: _isDefault,
          onChanged: isBusy ? null : (bool v) => setState(() => _isDefault = v),
          title: Text(l10n.makeDefaultAddress),
          contentPadding: EdgeInsets.zero,
        ),
        if (_failure != null) ...<Widget>[
          const SizedBox(height: 12),
          AuthErrorBanner(message: _failure!.message(l10n)),
        ],
        const SizedBox(height: 22),
        AuthSubmitButton(
          label: l10n.saveAddress,
          isBusy: isBusy,
          onPressed: _save,
        ),
      ],
    );
  }
}

/// Read-only echo of the pin, with a way back to the map.
class _PinnedCoordinates extends StatelessWidget {
  const _PinnedCoordinates({
    required this.latitude,
    required this.longitude,
    required this.onEdit,
  });

  final double latitude;
  final double longitude;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.location_on_rounded,
            size: 20,
            color: AppColors.orangeDeep,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  l10n.pinnedLocation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${latitude.toStringAsFixed(5)}, '
                  '${longitude.toStringAsFixed(5)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          TextButton(onPressed: onEdit, child: Text(l10n.changePin)),
        ],
      ),
    );
  }
}

class _LabelPicker extends StatelessWidget {
  const _LabelPicker({required this.value, required this.onChanged});

  final AddressLabel value;
  final ValueChanged<AddressLabel> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    final Map<AddressLabel, (IconData, String)> options =
        <AddressLabel, (IconData, String)>{
      AddressLabel.home: (Icons.home_rounded, l10n.labelHome),
      AddressLabel.work: (Icons.work_outline_rounded, l10n.labelWork),
      AddressLabel.other: (Icons.place_outlined, l10n.labelOther),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4, bottom: 8),
          child: Text(
            l10n.saveAddressAs,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        // Wrap, not Row: three translated labels overflow a single line on a
        // narrow phone at a large font size.
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (final MapEntry<AddressLabel, (IconData, String)> entry
                in options.entries)
              ChoiceChip(
                selected: value == entry.key,
                onSelected: (_) => onChanged(entry.key),
                avatar: Icon(entry.value.$1, size: 17),
                label: Text(entry.value.$2),
              ),
          ],
        ),
      ],
    );
  }
}
