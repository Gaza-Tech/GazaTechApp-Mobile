// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_listing_model.freezed.dart';
part 'ai_chat_listing_model.g.dart';

@freezed
abstract class AiChatListingModel with _$AiChatListingModel {
  const factory AiChatListingModel({
    @JsonKey(name: 'listing_id') required String listingId,
    required String title,
    required num price,
    @Default('ILS') String currency,
    @JsonKey(name: 'product_condition') @Default('') String productCondition,
    String? image,
    String? location,
    String? sellerName,
    @Default(false) bool isVerified,
    String? category,
  }) = _AiChatListingModel;

  factory AiChatListingModel.fromJson(Map<String, dynamic> json) =>
      _$AiChatListingModelFromJson(json);
}
