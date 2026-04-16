import 'package:gaza_tech/core/netowoks/api_error_model.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:http/http.dart' as http;

import '../models/ai_chat_listing_model.dart';
import '../models/chat_message_model.dart';
import '../services/ai_chat_api_service.dart';

const kAiChatCancelled = '__ai_chat_cancelled__';

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
            (e) => AiChatListingModel.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
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
    } on http.ClientException {
      return ApiResult.failure(
        ApiErrorModel(message: kAiChatCancelled, statusCode: -1),
      );
    } catch (error) {
      final msg = error.toString();
      if (msg.contains('Connection closed') ||
          msg.contains('Client is already closed')) {
        return ApiResult.failure(
          ApiErrorModel(message: kAiChatCancelled, statusCode: -1),
        );
      }
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  void cancel() => _apiService.abort();
}
