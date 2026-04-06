import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

import '../cubit/ai_chat_cubit.dart';
import '../cubit/ai_chat_state.dart';
import 'widgets/ai_chat_empty_state.dart';
import 'widgets/ai_chat_input_bar.dart';
import 'widgets/chat_message_bubble.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.aiChat),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmClearChat(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<AiChatCubit, AiChatState>(
              listenWhen: (prev, curr) =>
                  prev.errorMessage != curr.errorMessage &&
                  curr.errorMessage != null,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? context.l10n.aiChatError,
                    ),
                  ),
                );
              },
              builder: (context, state) {
                if (state.messages.isEmpty && !state.isLoading) {
                  return const AiChatEmptyState();
                }

                final itemCount =
                    state.messages.length + (state.isLoading ? 1 : 0);

                return ListView.builder(
                  controller:
                      context.read<AiChatCubit>().scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index == state.messages.length) {
                      return _buildTypingIndicator(context);
                    }
                    return ChatMessageBubble(
                      message: state.messages[index],
                    );
                  },
                );
              },
            ),
          ),
          const AiChatInputBar(),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: SizedBox(
          width: 40.w,
          height: 12.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) {
              return _AnimatedDot(delay: i * 200);
            }),
          ),
        ),
      ),
    );
  }

  void _confirmClearChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.clearChat),
        content: Text(context.l10n.clearChatConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<AiChatCubit>().clearChat();
              Navigator.of(dialogContext).pop();
            },
            child: Text(context.l10n.clearChat),
          ),
        ],
      ),
    );
  }
}

class _AnimatedDot extends StatefulWidget {
  final int delay;
  const _AnimatedDot({required this.delay});

  @override
  State<_AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_animation.value * 0.7),
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.bodySmall?.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
