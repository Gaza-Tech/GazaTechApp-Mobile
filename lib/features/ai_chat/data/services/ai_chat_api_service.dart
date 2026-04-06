import 'package:supabase_flutter/supabase_flutter.dart';

class AiChatApiService {
  final SupabaseClient _supabase;

  AiChatApiService(this._supabase);

  Future<Map<String, dynamic>> sendMessage(String message) async {
    final response = await _supabase.functions.invoke(
      'chat-search',
      body: {'message': message},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }
}
