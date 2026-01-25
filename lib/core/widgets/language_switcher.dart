import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton.icon(
        onPressed: () => context.read<LocaleCubit>().toggleLocale(),
        icon: const Icon(Icons.language, size: 20),
        label: Text(
          context.read<LocaleCubit>().isArabic
              ? context.l10n.english
              : context.l10n.arabic,
          style: MyTextStyle.action.s,
        ),
      ),
    );
  }
}
