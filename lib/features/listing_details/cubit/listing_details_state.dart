import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';

part 'listing_details_state.freezed.dart';

@freezed
abstract class ListingDetailsState with _$ListingDetailsState {
  const factory ListingDetailsState.initial() = _Initial;
  const factory ListingDetailsState.loading() = _Loading;
  const factory ListingDetailsState.success({
    required ListingDetailModel listing,
    required List<ListingModel> similarListings,
    required List<ListingModel> sellerListings,
    @Default(false) bool isBookmarked,
  }) = _Success;
  const factory ListingDetailsState.failure(String message) = _Failure;
}
