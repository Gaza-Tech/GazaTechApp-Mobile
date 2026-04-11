import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Modal bottom sheet shown when a guest user attempts a write action.
/// Offers the guest the chance to sign up or sign in to a real account.
class SignUpPromptSheet extends StatelessWidget {
  const SignUpPromptSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const SignUpPromptSheet(),
    );
  }

  Future<void> _leaveGuestAndGoTo(
    BuildContext sheetContext,
    String routeName,
  ) async {
    // Capture the root navigator before popping — the sheet's own
    // BuildContext becomes unmounted as soon as the sheet closes, so any
    // navigation driven through it would silently no-op.
    final rootNavigator = Navigator.of(sheetContext, rootNavigator: true);
    Navigator.of(sheetContext).pop();
    await Supabase.instance.client.auth.signOut();
    rootNavigator.pushNamedAndRemoveUntil(routeName, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            const VerticalSpace(20),
            Text(
              context.l10n.signUpPromptTitle,
              style: MyTextStyle.heading.h2,
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(12),
            Text(
              context.l10n.signUpPromptMessage,
              style: MyTextStyle.body.m,
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(24),
            MyButton(
              onPressed: () => _leaveGuestAndGoTo(context, MyRoutes.signUp),
              height: 48.h,
              text: context.l10n.signUpPromptSignUp,
              textStyle: MyTextStyle.action.l,
            ),
            const VerticalSpace(12),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: OutlinedButton(
                onPressed: () => _leaveGuestAndGoTo(context, MyRoutes.signIn),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[400]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.dg),
                  ),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text(
                  context.l10n.signUpPromptSignIn,
                  style: MyTextStyle.action.l,
                ),
              ),
            ),
            const VerticalSpace(8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
