import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileApiService {
  final SupabaseClient _supabase;

  EditProfileApiService(this._supabase);

  Future<void> updateProfile(Map<String, dynamic> data) async {
    final userId = _supabase.auth.currentUser!.id;
    await _supabase.from('users').update(data).eq('user_id', userId);
  }

  Future<String> uploadAvatar(String userId, File file) async {
    final extension = file.path.split('.').last.toLowerCase();
    final path = '$userId/avatar.$extension';

    await _supabase.storage
        .from('profile-avatars')
        .upload(path, file, fileOptions: const FileOptions(upsert: true));

    return _supabase.storage.from('profile-avatars').getPublicUrl(path);
  }

  Future<void> deleteAvatar(String userId) async {
    final extension = ['jpg', 'jpeg', 'png', 'webp'];
    for (final ext in extension) {
      try {
        await _supabase.storage.from('profile-avatars').remove([
          '$userId/avatar.$ext',
        ]);
      } catch (_) {}
    }
    await _supabase
        .from('users')
        .update({'avatar_url': null})
        .eq('user_id', userId);
  }
}
