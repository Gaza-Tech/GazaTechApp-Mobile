import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/ai_chat/data/models/chat_message_model.dart';

import 'ai_listing_list.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = message.isUser;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: isUser
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            child: Container(
              constraints: BoxConstraints(maxWidth: 0.78.sw),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isUser
                    ? MyColors.primary.base
                    : theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message.text.isNotEmpty)
                    Text(
                      message.text,
                      style: MyTextStyle.body.s.copyWith(
                        color: isUser
                            ? Colors.white
                            : theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  if (!isUser && message.isStopped)
                    Padding(
                      padding: EdgeInsets.only(
                        top: message.text.isNotEmpty ? 4.h : 0,
                      ),
                      child: Text(
                        context.l10n.aiChatStopped,
                        style: MyTextStyle.body.xs.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (!isUser && message.listings.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: AiListingList(listings: message.listings),
            ),
        ],
      ),
    );
  }
}
