import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/features/auth/logout/cubit/logout_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  radius: 32,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
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
              // TODO: Navigate to profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(context.l10n.settings),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to settings screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(context.l10n.language),
            onTap: () {
              Navigator.pop(context);
              // TODO: Show language selection dialog
              context.read<LocaleCubit>().toggleLocale();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(context.l10n.about),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to about screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(context.l10n.help),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to help screen
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              context.l10n.logout,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {
              Navigator.pop(context);
              context.read<LogoutCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
