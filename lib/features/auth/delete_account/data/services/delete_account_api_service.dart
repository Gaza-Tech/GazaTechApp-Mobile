import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteAccountApiService {
  final SupabaseClient _supabase;
  DeleteAccountApiService(this._supabase);

  Future<void> deactivateAccount() async {
    final userId = _supabase.auth.currentUser!.id;
    await _supabase
        .from('users')
        .update({'is_active': false})
        .eq('user_id', userId);
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
