import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/localization/locale_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../generated/l10n/app_localizations.dart';
import '../auth/data/auth_failure.dart';
import '../auth/data/auth_user.dart';
import '../auth/state/auth_controller.dart';

/// Edits the name, email and mobile number via `PATCH /v1/profile`.
///
/// The API creates every account named "Nexmile user", so this is where a
/// customer first gets a real name. Role and account status are deliberately
/// absent — the endpoint refuses them, and for good reason.
Future<bool> showEditProfileSheet(BuildContext context) async {
  final bool? saved = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (BuildContext context) => const _EditProfileSheet(),
  );
  return saved ?? false;
}

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet();

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final AuthUser? user = context.read<AuthController>().user;
    _name = TextEditingController(text: user?.name ?? '');
    _email = TextEditingController(text: user?.email ?? '');
    _phone = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) return AppLocalizations.of(context).fieldRequired;
    return null;
  }

  String? _validateEmail(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) return null;
    // Deliberately loose: the server is the authority and returns a 422 in its
    // own wording. This only catches the obvious typo before a round trip.
    final bool looksLikeEmail =
        RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmed);
    return looksLikeEmail
        ? null
        : AppLocalizations.of(context).invalidEmailOrPhone;
  }

  String? _validatePhone(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) return null;
    // The schema's own pattern for an Indian mobile number.
    final bool looksLikeMobile = RegExp(r'^[6-9]\d{9}$').hasMatch(trimmed);
    return looksLikeMobile
        ? null
        : AppLocalizations.of(context).invalidMobileNumber;
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final AppLocalizations l10n = AppLocalizations.of(context);
    final AuthController auth = context.read<AuthController>();
    final NavigatorState navigator = Navigator.of(context);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final String language =
        context.read<LocaleController>().locale.languageCode;

    setState(() => _isSaving = true);
    final AuthFailure? failure = await auth.updateProfile(
      name: _name.text.trim(),
      email: _email.text.trim().isEmpty ? null : _email.text.trim(),
      phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
      // The API accepts only en, ta and hi; the app offers 23, so any other
      // choice is simply not sent rather than forced into one of the three.
      preferredLocale: AuthController.serverLocaleFor(language),
    );
    if (!mounted) return;
    setState(() => _isSaving = false);

    if (failure == null) {
      navigator.pop(true);
      messenger
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(l10n.profileUpdated)));
      return;
    }

    // Validators do not re-fire on their own after a rejected submit, so the
    // server's field errors would otherwise never appear under the fields.
    _formKey.currentState?.validate();
    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(content: Text(auth.firstError() ?? failure.message(l10n))),
      );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AuthController auth = context.watch<AuthController>();

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  l10n.editProfileTitle,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  l10n.editProfileSubtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                maxLength: 255,
                validator: _validateName,
                decoration: InputDecoration(
                  labelText: l10n.nameLabel,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  border: const OutlineInputBorder(),
                  errorText: auth.firstError('name'),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                maxLength: 255,
                validator: _validateEmail,
                // An address reads left to right in every language.
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: l10n.emailLabel,
                  prefixIcon: const Icon(Icons.alternate_email_rounded),
                  border: const OutlineInputBorder(),
                  errorText: auth.firstError('email'),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: _validatePhone,
                decoration: InputDecoration(
                  labelText: l10n.mobileLabel,
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: const OutlineInputBorder(),
                  errorText: auth.firstError('phone'),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _isSaving ? null : _save,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.greenDeep,
                  minimumSize: const Size.fromHeight(52),
                ),
                child: _isSaving
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : Text(l10n.saveChanges),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
