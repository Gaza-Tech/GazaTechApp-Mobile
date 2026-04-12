import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/netowoks/supabase_config.dart';

class AiChatApiService {
  final SupabaseClient _supabase;
  http.Client _client;

  AiChatApiService(this._supabase) : _client = http.Client();

  Future<Map<String, dynamic>> sendMessage(String message) async {
    _client = http.Client();

    final uri = Uri.parse('$supabaseUrl/functions/v1/chat-search');
    final token = _supabase.auth.currentSession?.accessToken ?? supabaseAnonKey;

    final response = await _client.post(
      uri,
      headers: {
        'apikey': supabaseAnonKey,
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Edge function error ${response.statusCode}: ${response.body}',
      );
    }

    return Map<String, dynamic>.from(jsonDecode(response.body) as Map);
  }

  void abort() => _client.close();
}
