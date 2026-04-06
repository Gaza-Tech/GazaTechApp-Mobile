import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_chat_listing_model.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String id,
    required String text,
    required bool isUser,
    required DateTime timestamp,
    @Default([]) List<AiChatListingModel> listings,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
