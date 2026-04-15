import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerificationApiService {
  final SupabaseClient _supabase;

  VerificationApiService(this._supabase);

  static const String _bucket = 'verification-requests';
  static const String _table = 'verification_requests';

  Future<Map<String, dynamic>?> fetchLatestRequest() async {
    final userId = _supabase.auth.currentUser!.id;
    return await _supabase
        .from(_table)
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();
  }

  Future<Map<String, dynamic>> submitRequest(Map<String, dynamic> data) async {
    debugPrint('[VerificationApiService] Inserting into $_table...');
    final result = await _supabase.from(_table).insert(data).select().single();
    debugPrint('[VerificationApiService] Insert result: $result');
    return result;
  }

  Future<String> uploadDocument({
    required String userId,
    required File file,
    required String documentName,
  }) async {
    final extension = file.path.split('.').last.toLowerCase();
    final path = '$userId/$documentName.$extension';
    debugPrint('[VerificationApiService] Uploading $path (${file.lengthSync()} bytes)');

    await _supabase.storage
        .from(_bucket)
        .upload(path, file, fileOptions: const FileOptions(upsert: true));

    final url = _supabase.storage.from(_bucket).getPublicUrl(path);
    debugPrint('[VerificationApiService] Upload OK → $url');
    return url;
  }

  Future<void> sendPhoneOtp(String phoneNumber) async {
    await _supabase.auth.updateUser(UserAttributes(phone: phoneNumber));
  }

  Future<void> verifyPhoneOtp({
    required String phone,
    required String token,
  }) async {
    await _supabase.auth.verifyOTP(
      phone: phone,
      token: token,
      type: OtpType.phoneChange,
    );
  }

  Future<void> updateUserPhone({
    required String userId,
    required String phone,
  }) async {
    await _supabase
        .from('users')
        .update({'phone_number': phone})
        .eq('user_id', userId);
  }

  Future<void> updatePhoneVerified(String requestId) async {
    await _supabase
        .from(_table)
        .update({'phone_verified': true})
        .eq('verification_request_id', requestId);
  }
}
