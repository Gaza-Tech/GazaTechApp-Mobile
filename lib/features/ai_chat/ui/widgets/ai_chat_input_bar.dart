import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

import '../../cubit/ai_chat_cubit.dart';
import '../../cubit/ai_chat_state.dart';

class AiChatInputBar extends StatelessWidget {
  const AiChatInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AiChatCubit>();

    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        8.h,
        8.w,
        8.h + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cubit.messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => cubit.sendMessage(),
              style: MyTextStyle.body.s,
              decoration: InputDecoration(
                hintText: context.l10n.aiChatHint,
                hintStyle: MyTextStyle.body.s.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHigh,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          BlocBuilder<AiChatCubit, AiChatState>(
            buildWhen: (prev, curr) => prev.isLoading != curr.isLoading,
            builder: (context, state) {
              return IconButton(
                onPressed: state.isLoading ? null : () => cubit.sendMessage(),
                icon: state.isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(
                        Icons.send_rounded,
                        color: MyColors.primary.base,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
