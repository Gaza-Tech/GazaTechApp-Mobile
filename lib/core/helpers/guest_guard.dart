import 'package:flutter/material.dart';
import 'package:gaza_tech/core/widgets/sign_up_prompt_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Helpers for gating write actions when the current user is an anonymous
/// (guest) Supabase user.
///
/// The [isGuest] check is overridable via [debugIsGuestOverride] so unit
/// tests can exercise gated code paths without booting Supabase.
class GuestGuard {
  const GuestGuard._();

  /// Test-only override. When non-null, [isGuest] returns this value
  /// instead of reading `Supabase.instance`. Reset to `null` in `tearDown`.
  @visibleForTesting
  static bool? debugIsGuestOverride;

  /// True if the current Supabase user is signed in anonymously.
  static bool get isGuest {
    final override = debugIsGuestOverride;
    if (override != null) return override;
    return Supabase.instance.client.auth.currentUser?.isAnonymous ?? false;
  }

  /// Returns `true` if the caller may proceed with a write action.
  ///
  /// For real accounts this returns `true` immediately. For guests it opens
  /// the sign-up prompt sheet and returns `false`, so the caller can simply
  /// early-return:
  ///
  /// ```dart
  /// if (!await GuestGuard.requireAccount(context)) return;
  // / // ... proceed with write action
  /// ```
  static Future<bool> requireAccount(BuildContext context) async {
    if (!isGuest) return true;
    await SignUpPromptSheet.show(context);
    return false;
  }
}
