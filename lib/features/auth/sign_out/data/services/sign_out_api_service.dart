import 'package:supabase_flutter/supabase_flutter.dart';

class SignOutApiService {
  final SupabaseClient _supabase;
  SignOutApiService(this._supabase);

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
