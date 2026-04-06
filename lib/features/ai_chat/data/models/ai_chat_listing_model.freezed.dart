// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiChatListingModel {

@JsonKey(name: 'listing_id') String get listingId; String get title; num get price; String get currency;@JsonKey(name: 'product_condition') String get productCondition; String? get image; String? get location; String? get sellerName; bool get isVerified; String? get category;
/// Create a copy of AiChatListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatListingModelCopyWith<AiChatListingModel> get copyWith => _$AiChatListingModelCopyWithImpl<AiChatListingModel>(this as AiChatListingModel, _$identity);

  /// Serializes this AiChatListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatListingModel&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productCondition, productCondition) || other.productCondition == productCondition)&&(identical(other.image, image) || other.image == image)&&(identical(other.location, location) || other.location == location)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId,title,price,currency,productCondition,image,location,sellerName,isVerified,category);

@override
String toString() {
  return 'AiChatListingModel(listingId: $listingId, title: $title, price: $price, currency: $currency, productCondition: $productCondition, image: $image, location: $location, sellerName: $sellerName, isVerified: $isVerified, category: $category)';
}


}

/// @nodoc
abstract mixin class $AiChatListingModelCopyWith<$Res>  {
  factory $AiChatListingModelCopyWith(AiChatListingModel value, $Res Function(AiChatListingModel) _then) = _$AiChatListingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId, String title, num price, String currency,@JsonKey(name: 'product_condition') String productCondition, String? image, String? location, String? sellerName, bool isVerified, String? category
});




}
/// @nodoc
class _$AiChatListingModelCopyWithImpl<$Res>
    implements $AiChatListingModelCopyWith<$Res> {
  _$AiChatListingModelCopyWithImpl(this._self, this._then);

  final AiChatListingModel _self;
  final $Res Function(AiChatListingModel) _then;

/// Create a copy of AiChatListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listingId = null,Object? title = null,Object? price = null,Object? currency = null,Object? productCondition = null,Object? image = freezed,Object? location = freezed,Object? sellerName = freezed,Object? isVerified = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,productCondition: null == productCondition ? _self.productCondition : productCondition // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AiChatListingModel].
extension AiChatListingModelPatterns on AiChatListingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiChatListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiChatListingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiChatListingModel value)  $default,){
final _that = this;
switch (_that) {
case _AiChatListingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiChatListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _AiChatListingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId,  String title,  num price,  String currency, @JsonKey(name: 'product_condition')  String productCondition,  String? image,  String? location,  String? sellerName,  bool isVerified,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiChatListingModel() when $default != null:
return $default(_that.listingId,_that.title,_that.price,_that.currency,_that.productCondition,_that.image,_that.location,_that.sellerName,_that.isVerified,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId,  String title,  num price,  String currency, @JsonKey(name: 'product_condition')  String productCondition,  String? image,  String? location,  String? sellerName,  bool isVerified,  String? category)  $default,) {final _that = this;
switch (_that) {
case _AiChatListingModel():
return $default(_that.listingId,_that.title,_that.price,_that.currency,_that.productCondition,_that.image,_that.location,_that.sellerName,_that.isVerified,_that.category);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'listing_id')  String listingId,  String title,  num price,  String currency, @JsonKey(name: 'product_condition')  String productCondition,  String? image,  String? location,  String? sellerName,  bool isVerified,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _AiChatListingModel() when $default != null:
return $default(_that.listingId,_that.title,_that.price,_that.currency,_that.productCondition,_that.image,_that.location,_that.sellerName,_that.isVerified,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiChatListingModel implements AiChatListingModel {
  const _AiChatListingModel({@JsonKey(name: 'listing_id') required this.listingId, required this.title, required this.price, this.currency = 'ILS', @JsonKey(name: 'product_condition') this.productCondition = '', this.image, this.location, this.sellerName, this.isVerified = false, this.category});
  factory _AiChatListingModel.fromJson(Map<String, dynamic> json) => _$AiChatListingModelFromJson(json);

@override@JsonKey(name: 'listing_id') final  String listingId;
@override final  String title;
@override final  num price;
@override@JsonKey() final  String currency;
@override@JsonKey(name: 'product_condition') final  String productCondition;
@override final  String? image;
@override final  String? location;
@override final  String? sellerName;
@override@JsonKey() final  bool isVerified;
@override final  String? category;

/// Create a copy of AiChatListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiChatListingModelCopyWith<_AiChatListingModel> get copyWith => __$AiChatListingModelCopyWithImpl<_AiChatListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiChatListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiChatListingModel&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productCondition, productCondition) || other.productCondition == productCondition)&&(identical(other.image, image) || other.image == image)&&(identical(other.location, location) || other.location == location)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId,title,price,currency,productCondition,image,location,sellerName,isVerified,category);

@override
String toString() {
  return 'AiChatListingModel(listingId: $listingId, title: $title, price: $price, currency: $currency, productCondition: $productCondition, image: $image, location: $location, sellerName: $sellerName, isVerified: $isVerified, category: $category)';
}


}

/// @nodoc
abstract mixin class _$AiChatListingModelCopyWith<$Res> implements $AiChatListingModelCopyWith<$Res> {
  factory _$AiChatListingModelCopyWith(_AiChatListingModel value, $Res Function(_AiChatListingModel) _then) = __$AiChatListingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId, String title, num price, String currency,@JsonKey(name: 'product_condition') String productCondition, String? image, String? location, String? sellerName, bool isVerified, String? category
});




}
/// @nodoc
class __$AiChatListingModelCopyWithImpl<$Res>
    implements _$AiChatListingModelCopyWith<$Res> {
  __$AiChatListingModelCopyWithImpl(this._self, this._then);

  final _AiChatListingModel _self;
  final $Res Function(_AiChatListingModel) _then;

/// Create a copy of AiChatListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listingId = null,Object? title = null,Object? price = null,Object? currency = null,Object? productCondition = null,Object? image = freezed,Object? location = freezed,Object? sellerName = freezed,Object? isVerified = null,Object? category = freezed,}) {
  return _then(_AiChatListingModel(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,productCondition: null == productCondition ? _self.productCondition : productCondition // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
