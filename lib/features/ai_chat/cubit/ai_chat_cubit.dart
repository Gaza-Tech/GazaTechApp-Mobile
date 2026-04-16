import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/chat_message_model.dart';
import '../data/repos/ai_chat_repo.dart';
import 'ai_chat_state.dart';

// Exported so widgets can reference it if needed.
export '../data/repos/ai_chat_repo.dart' show kAiChatCancelled;

class AiChatCubit extends Cubit<AiChatState> {
  final AiChatRepo _repo;
  final SharedPreferences _prefs;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  static const int _maxMessages = 100;

  AiChatCubit(this._repo, this._prefs) : super(const AiChatState());

  void loadHistory() {
    final raw = _prefs.getString(SharedPrefKeys.aiChatHistory);
    if (raw == null || raw.isEmpty) return;

    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      final messages = decoded
          .map(
            (e) =>
                ChatMessageModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
      emit(state.copyWith(messages: messages));
      _scrollToBottom();
    } catch (_) {
      // Corrupted data — ignore
    }
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty || state.isLoading) return;

    messageController.clear();

    final userMsg = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    emit(
      state.copyWith(
        messages: [...state.messages, userMsg],
        isLoading: true,
        errorMessage: null,
      ),
    );
    _scrollToBottom();

    final result = await _repo.sendMessage(text);

    result.when(
      success: (aiMessage) {
        emit(
          state.copyWith(
            messages: [...state.messages, aiMessage],
            isLoading: false,
          ),
        );
        _saveHistory();
        _scrollToBottom();
      },
      failure: (error) {
        if (error.message == kAiChatCancelled) {
          final stoppedMsg = ChatMessageModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: '',
            isUser: false,
            timestamp: DateTime.now(),
            isStopped: true,
          );
          emit(
            state.copyWith(
              messages: [...state.messages, stoppedMsg],
              isLoading: false,
            ),
          );
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: error.message));
        }
        _saveHistory();
      },
    );
  }

  void stopGeneration() => _repo.cancel();

  void clearChat() {
    _prefs.remove(SharedPrefKeys.aiChatHistory);
    emit(const AiChatState());
  }

  void _saveHistory() {
    final messages = state.messages.length > _maxMessages
        ? state.messages.sublist(state.messages.length - _maxMessages)
        : state.messages;

    final encoded = jsonEncode(messages.map((m) => m.toJson()).toList());
    _prefs.setString(SharedPrefKeys.aiChatHistory, encoded);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Future<void> close() {
    messageController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
