import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';

part 'add_listing_state.freezed.dart';

@freezed
abstract class AddListingState with _$AddListingState {
  const factory AddListingState({
    // Form data from DB
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<LocationModel> locations,
    @Default(false) bool isLoadingFormData,

    // Submission
    @Default(false) bool isSubmitting,
    @Default(false) bool submitSuccess,

    // Error
    String? errorMessage,
  }) = _AddListingState;
}
