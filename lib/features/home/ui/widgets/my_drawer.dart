import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/confirmation_sheet.dart';
import 'package:gaza_tech/core/widgets/language_bottom_sheet.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return;
    final data = await Supabase.instance.client
        .from('users')
        .select('avatar_url')
        .eq('user_id', userId)
        .maybeSingle();
    if (mounted && data != null) {
      setState(() => _avatarUrl = data['avatar_url'] as String?);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: ClipOval(
                    child: _avatarUrl != null
                        ? CachedNetworkImage(
                            imageUrl: _avatarUrl!,
                            width: 64.r,
                            height: 64.r,
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => Icon(
                              Icons.person,
                              size: 40.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 40.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  ),
                ),
                const VerticalSpace(12),
                Text(
                  context.l10n.welcomeHome,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(context.l10n.profile),
            onTap: () {
              Navigator.pop(context);
              final userId = Supabase.instance.client.auth.currentUser?.id;
              if (userId != null) {
                Navigator.pushNamed(
                  context,
                  MyRoutes.profile,
                  arguments: {'userId': userId, 'isOwnProfile': true},
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmarks_outlined),
            title: Text(context.l10n.bookmarks),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.bookmarks);
            },
          ),
          if (Supabase.instance.client.auth.currentUser != null)
            ListTile(
              leading: const Icon(Icons.drafts_outlined),
              title: Text(context.l10n.myDrafts),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, MyRoutes.drafts);
              },
            ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(context.l10n.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(context.l10n.language),
            onTap: () => showLanguageBottomSheet(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(context.l10n.about),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.about);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(context.l10n.help),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.help);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              context.l10n.sign_out,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {
              final cubit = context.read<SignOutCubit>();
              final l10n = context.l10n;
              final errorColor = Theme.of(context).colorScheme.error;
              Navigator.pop(context);
              showConfirmationSheet(
                context,
                title: l10n.signOutConfirmTitle,
                body: l10n.signOutConfirmBody,
                confirmLabel: l10n.signOutConfirmButton,
                confirmColor: errorColor,
                onConfirm: cubit.emitSignOutState,
              );
            },
          ),
        ],
      ),
    );
  }
}
