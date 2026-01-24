import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthApiService {
  final SupabaseClient _supabase;
  late final GoogleSignIn _googleSignIn;

  GoogleAuthApiService(this._supabase) {
    _googleSignIn = GoogleSignIn(
      serverClientId:
          '498017958574-7caqi3vq2pk50eoq1t1u1rpfunddut11.apps.googleusercontent.com',
    );
  }

  Future<AuthResponse> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw const AuthException('Sign-in cancelled');
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw const AuthException('No ID token received');
    }

    return await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: googleAuth.accessToken,
    );
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _supabase.auth.signOut();
  }
}
