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

  void _showDeleteAccountDialog() {
    final l10n = context.l10n;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteAccountTitle),
        content: Text(l10n.deleteAccountBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.ok)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
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
            title: Text(l10n.notifyListingInquiries, style: MyTextStyle.body.m),
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
            onTap: () => Navigator.pushNamed(context, MyRoutes.forgotPassword),
          ),
          ListTile(
            leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            title: Text(
              l10n.deleteAccount,
              style: MyTextStyle.body.m.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            onTap: _showDeleteAccountDialog,
          ),
          SizedBox(height: 24.h),
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
