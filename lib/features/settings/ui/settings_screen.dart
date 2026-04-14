import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/language_bottom_sheet.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/core/localization/locale_state.dart';
import 'package:gaza_tech/features/auth/delete_account/cubit/delete_account_cubit.dart';
import 'package:gaza_tech/features/auth/delete_account/cubit/delete_account_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifyNewComments = true;
  bool _notifyNewLikes = true;
  bool _notifyListingInquiries = true;
  bool _notifyVerificationUpdates = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final comments = await SharedPrefHelper.getBool(
      SharedPrefKeys.notifyNewComments,
    );
    final likes = await SharedPrefHelper.getBool(SharedPrefKeys.notifyNewLikes);
    final inquiries = await SharedPrefHelper.getBool(
      SharedPrefKeys.notifyListingInquiries,
    );
    final verification = await SharedPrefHelper.getBool(
      SharedPrefKeys.notifyVerificationUpdates,
    );
    if (!mounted) return;
    setState(() {
      _notifyNewComments = comments ?? true;
      _notifyNewLikes = likes ?? true;
      _notifyListingInquiries = inquiries ?? true;
      _notifyVerificationUpdates = verification ?? true;
    });
  }

  Future<void> _setNotifPref(String key, bool value) async {
    await SharedPrefHelper.setData(key, value);
  }

  void _showDeleteAccountSheet() {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final confirmWord = l10n.deleteConfirmWord;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (sheetContext) {
        return _DeleteAccountSheet(
          confirmWord: confirmWord,
          title: l10n.deleteAccountTitle,
          body: l10n.deleteAccountBody,
          hintText: l10n.deleteAccountTypeToConfirm,
          confirmButtonLabel: l10n.deleteAccountConfirmButton,
          errorColor: theme.colorScheme.error,
          onConfirm: () {
            Navigator.pop(sheetContext);
            context.read<DeleteAccountCubit>().emitDeleteAccountState();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          ),
          success: (_) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            context.pushNamedAndRemoveUntil(
              MyRoutes.signIn,
              predicate: (route) => false,
            );
          },
          failure: (message) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.settings)),
        body: ListView(
          children: [
            _SectionHeader(title: l10n.notificationPreferences),
            SwitchListTile(
              title: Text(l10n.notifyNewComments, style: MyTextStyle.body.m),
              value: _notifyNewComments,
              onChanged: (val) {
                setState(() => _notifyNewComments = val);
                _setNotifPref(SharedPrefKeys.notifyNewComments, val);
              },
            ),
            SwitchListTile(
              title: Text(l10n.notifyNewLikes, style: MyTextStyle.body.m),
              value: _notifyNewLikes,
              onChanged: (val) {
                setState(() => _notifyNewLikes = val);
                _setNotifPref(SharedPrefKeys.notifyNewLikes, val);
              },
            ),
            SwitchListTile(
              title: Text(
                l10n.notifyListingInquiries,
                style: MyTextStyle.body.m,
              ),
              value: _notifyListingInquiries,
              onChanged: (val) {
                setState(() => _notifyListingInquiries = val);
                _setNotifPref(SharedPrefKeys.notifyListingInquiries, val);
              },
            ),
            SwitchListTile(
              title: Text(
                l10n.notifyVerificationUpdates,
                style: MyTextStyle.body.m,
              ),
              value: _notifyVerificationUpdates,
              onChanged: (val) {
                setState(() => _notifyVerificationUpdates = val);
                _setNotifPref(SharedPrefKeys.notifyVerificationUpdates, val);
              },
            ),
            const Divider(),
            _SectionHeader(title: l10n.language),
            BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                final currentLang = state.locale.languageCode == 'ar'
                    ? l10n.arabic
                    : l10n.english;
                return ListTile(
                  leading: const Icon(Icons.language_outlined),
                  title: Text(l10n.language, style: MyTextStyle.body.m),
                  trailing: Text(
                    currentLang,
                    style: MyTextStyle.body.s.copyWith(
                      color: isDark
                          ? MyColors.primary.onDark
                          : MyColors.primary.base,
                    ),
                  ),
                  onTap: () => showLanguageBottomSheet(context),
                );
              },
            ),
            const Divider(),
            _SectionHeader(title: l10n.accountSettings),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: Text(l10n.changePassword, style: MyTextStyle.body.m),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.forgotPassword),
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline,
                color: theme.colorScheme.error,
              ),
              title: Text(
                l10n.deleteAccount,
                style: MyTextStyle.body.m.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              onTap: _showDeleteAccountSheet,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _DeleteAccountSheet extends StatefulWidget {
  final String confirmWord;
  final String title;
  final String body;
  final String hintText;
  final String confirmButtonLabel;
  final Color errorColor;
  final VoidCallback onConfirm;

  const _DeleteAccountSheet({
    required this.confirmWord,
    required this.title,
    required this.body,
    required this.hintText,
    required this.confirmButtonLabel,
    required this.errorColor,
    required this.onConfirm,
  });

  @override
  State<_DeleteAccountSheet> createState() => _DeleteAccountSheetState();
}

class _DeleteAccountSheetState extends State<_DeleteAccountSheet> {
  final _controller = TextEditingController();
  bool _canConfirm = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final matches = _controller.text.trim() == widget.confirmWord;
      if (matches != _canConfirm) setState(() => _canConfirm = matches);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24.w,
        24.h,
        24.w,
        MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),
          Text(widget.title, style: theme.textTheme.titleLarge),
          SizedBox(height: 8.h),
          Text(
            widget.body,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 20.h),
          TextField(
            controller: _controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          FilledButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(double.infinity, 48.h)),
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.disabled)
                    ? widget.errorColor.withAlpha(100)
                    : widget.errorColor,
              ),
            ),
            onPressed: _canConfirm ? widget.onConfirm : null,
            child: Text(widget.confirmButtonLabel),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 4.h),
      child: Text(
        title.toUpperCase(),
        style: MyTextStyle.caption.m.copyWith(
          color: isDark ? MyColors.primary.onDark : MyColors.primary.base,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
