import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/mixins/form_error_clearable.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/verification/data/repos/verification_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState>
    with FormErrorClearable {
  final VerificationRepo _repo;
  final _picker = ImagePicker();

  // Form controllers (live in cubit per convention)
  final fullNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  final nationalIdController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final formKeyStep1 = GlobalKey<FormState>();

  @override
  GlobalKey<FormState> get formKey => formKeyStep1;

  @override
  List<TextEditingController> get formControllers => [
    fullNameController,
    dateOfBirthController,
    addressController,
    nationalIdController,
    phoneController,
  ];

  DateTime? _selectedDateOfBirth;

  static const genders = ['male', 'female'];
  static const documentTypes = [
    'Palestinian ID',
    'Passport',
    'Palestinian driving licence',
  ];

  VerificationCubit(this._repo) : super(const VerificationState());

  Future<void> loadExistingRequest() async {
    emit(state.copyWith(isLoadingRequest: true, errorMessage: null));
    final result = await _repo.getLatestRequest();
    result.when(
      success: (request) => emit(
        state.copyWith(isLoadingRequest: false, existingRequest: request),
      ),
      failure: (error) => emit(
        state.copyWith(isLoadingRequest: false, errorMessage: error.message),
      ),
    );
  }

  void selectGender(int index) =>
      emit(state.copyWith(selectedGenderIndex: index));

  void selectDocumentType(int index) =>
      emit(state.copyWith(selectedDocumentTypeIndex: index));

  void selectDateOfBirth(DateTime date) {
    _selectedDateOfBirth = date;
    dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> pickDocumentFront({bool fromCamera = false}) async {
    final path = await _pickImage(preferCamera: fromCamera);
    if (path != null) emit(state.copyWith(documentFrontPath: path));
  }

  Future<void> pickDocumentBack({bool fromCamera = false}) async {
    final path = await _pickImage(preferCamera: fromCamera);
    if (path != null) emit(state.copyWith(documentBackPath: path));
  }

  Future<void> pickSelfie({bool fromCamera = false}) async {
    final path = await _pickImage(preferCamera: fromCamera);
    if (path != null) emit(state.copyWith(selfieWithIdPath: path));
  }

  Future<String?> _pickImage({bool preferCamera = false}) async {
    final source = preferCamera ? ImageSource.camera : ImageSource.gallery;
    final picked = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );
    return picked?.path;
  }

  bool nextStep() {
    switch (state.currentStep) {
      case 0:
        if (!formKeyStep1.currentState!.validate()) {
          return false;
        }
        if (state.selectedGenderIndex == -1) {
          return false;
        }
        if (_selectedDateOfBirth == null) {
          return false;
        }
        emit(state.copyWith(currentStep: 1));
        return true;
      case 1:
        if (state.selectedDocumentTypeIndex == -1) {
          return false;
        }
        if (state.documentFrontPath == null ||
            state.documentBackPath == null ||
            state.selfieWithIdPath == null) {
          return false;
        }
        emit(state.copyWith(currentStep: 2));
        return true;
      case 2:
        if (!state.isPhoneVerified) {
          return false;
        }
        emit(state.copyWith(currentStep: 3));
        return true;
      default:
        return false;
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  Future<void> sendPhoneOtp() async {
    final phone = phoneController.text.trim();
    emit(state.copyWith(isOtpSending: true, otpError: null));
    final result = await _repo.sendPhoneOtp(phone);
    result.when(
      success: (_) =>
          emit(state.copyWith(isOtpSending: false, isOtpSent: true)),
      failure: (error) =>
          emit(state.copyWith(isOtpSending: false, otpError: error.message)),
    );
  }

  Future<void> verifyPhoneOtp() async {
    final phone = phoneController.text.trim();
    final token = otpController.text.trim();
    emit(state.copyWith(isOtpVerifying: true, otpError: null));
    final result = await _repo.verifyPhoneOtp(phone: phone, token: token);
    result.when(
      success: (_) =>
          emit(state.copyWith(isOtpVerifying: false, isPhoneVerified: true)),
      failure: (error) =>
          emit(state.copyWith(isOtpVerifying: false, otpError: error.message)),
    );
  }

  Future<void> submitVerificationRequest(String userId) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    debugPrint('[Verification] Starting submission for user: $userId');

    String? frontUrl;
    final frontResult = await _repo.uploadDocument(
      userId: userId,
      file: File(state.documentFrontPath!),
      documentName: 'document_front',
    );
    frontResult.when(
      success: (url) {
        frontUrl = url;
        debugPrint('[Verification] Front uploaded: $url');
      },
      failure: (e) {
        debugPrint('[Verification] Front upload FAILED: ${e.message}');
        emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
      },
    );
    if (frontUrl == null) return;

    String? backUrl;
    final backResult = await _repo.uploadDocument(
      userId: userId,
      file: File(state.documentBackPath!),
      documentName: 'document_back',
    );
    backResult.when(
      success: (url) {
        backUrl = url;
        debugPrint('[Verification] Back uploaded: $url');
      },
      failure: (e) {
        debugPrint('[Verification] Back upload FAILED: ${e.message}');
        emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
      },
    );
    if (backUrl == null) return;

    String? selfieUrl;
    final selfieResult = await _repo.uploadDocument(
      userId: userId,
      file: File(state.selfieWithIdPath!),
      documentName: 'selfie_with_id',
    );
    selfieResult.when(
      success: (url) {
        selfieUrl = url;
        debugPrint('[Verification] Selfie uploaded: $url');
      },
      failure: (e) {
        debugPrint('[Verification] Selfie upload FAILED: ${e.message}');
        emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
      },
    );
    if (selfieUrl == null) return;

    final data = {
      'user_id': userId,
      'id_full_name': fullNameController.text.trim(),
      'id_date_of_birth': DateFormat(
        'yyyy-MM-dd',
      ).format(_selectedDateOfBirth!),
      'id_gender': genders[state.selectedGenderIndex],
      'address': addressController.text.trim(),
      'national_id_number': nationalIdController.text.trim(),
      'document_type': documentTypes[state.selectedDocumentTypeIndex],
      'document_front_url': frontUrl,
      'document_back_url': backUrl,
      'selfie_with_id_url': selfieUrl,
      'phone_verified': true,
    };

    debugPrint('[Verification] Inserting row with data: $data');

    final submitResult = await _repo.submitRequest(data);
    submitResult.when(
      success: (model) {
        debugPrint(
          '[Verification] SUCCESS — row ID: ${model.verificationRequestId}',
        );
        emit(state.copyWith(isSubmitting: false, submitSuccess: true));
      },
      failure: (error) {
        debugPrint('[Verification] INSERT FAILED: ${error.message}');
        emit(
          state.copyWith(isSubmitting: false, errorMessage: error.message),
        );
      },
    );
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    nationalIdController.dispose();
    phoneController.dispose();
    otpController.dispose();
    return super.close();
  }
}
