import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/chat_message_model.dart';

part 'ai_chat_state.freezed.dart';

@freezed
abstract class AiChatState with _$AiChatState {
  const factory AiChatState({
    @Default([]) List<ChatMessageModel> messages,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AiChatState;
}
