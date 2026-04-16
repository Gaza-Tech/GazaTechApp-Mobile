import 'package:supabase_flutter/supabase_flutter.dart';

class GuestAuthApiService {
  final SupabaseClient _supabase;

  GuestAuthApiService(this._supabase);

  Future<AuthResponse> signInAnonymously() async {
    // The public.users row is created automatically by the
    // `on_auth_user_created` trigger (SECURITY DEFINER) which reads
    // `raw_user_meta_data->>'name'` and splits it into first/last name.
    // Passing 'Guest User' here yields first_name='Guest', last_name='User'.
    final response = await _supabase.auth.signInAnonymously(
      data: {'name': 'Guest User'},
    );

    if (response.user == null) {
      throw const AuthException('Anonymous sign-in failed');
    }

    return response;
  }
}
