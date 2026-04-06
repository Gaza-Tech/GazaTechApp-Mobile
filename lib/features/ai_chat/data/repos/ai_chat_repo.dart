import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';

import '../models/ai_chat_listing_model.dart';
import '../models/chat_message_model.dart';
import '../services/ai_chat_api_service.dart';

class AiChatRepo {
  final AiChatApiService _apiService;

  AiChatRepo(this._apiService);

  Future<ApiResult<ChatMessageModel>> sendMessage(String message) async {
    try {
      final data = await _apiService.sendMessage(message);

      final reply = data['reply'] as String? ?? '';
      final rawListings = data['listings'] as List<dynamic>? ?? [];
      final listings = rawListings
          .map(
            (e) =>
                AiChatListingModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();

      final aiMessage = ChatMessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: reply,
        isUser: false,
        timestamp: DateTime.now(),
        listings: listings,
      );

      return ApiResult.success(aiMessage);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
