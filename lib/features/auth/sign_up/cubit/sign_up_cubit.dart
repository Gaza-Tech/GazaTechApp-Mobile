import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/mixins/form_error_clearable.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/models/sign_up_request_body.dart';
import '../data/repos/sign_up_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with FormErrorClearable {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  @override
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  List<TextEditingController> get formControllers => [
    emailController,
    passwordController,
    confirmPasswordController,
    firstNameController,
    lastNameController,
  ];

  Future<void> emitSignUpState() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignUpState.loading());

    final email = emailController.text.trim();

    // Check email availability before attempting sign-up
    final checkResult = await _signUpRepo.checkEmailAvailability(email);
    final emailStatus = checkResult.whenOrNull(success: (status) => status);

    if (emailStatus == 'banned') {
      emit(const SignUpState.emailBanned());
      return;
    }
    if (emailStatus == 'taken') {
      emit(const SignUpState.emailTaken());
      return;
    }

    final result = await _signUpRepo.signUp(
      SignUpRequestBody(
        email: email,
        password: passwordController.text.trim(),
        name:
            "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
      ),
    );

    result.when(
      success: (data) => emit(const SignUpState.success("Sign Up Successful")),
      failure: (error) => emit(SignUpState.failure(error.message ?? "Error")),
    );
  }
}
