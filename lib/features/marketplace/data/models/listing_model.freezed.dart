// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingModel {

@JsonKey(name: 'listing_id') String get listingId;@JsonKey(name: 'seller_id') String get sellerId; String get title; String get description;@JsonKey(name: 'category_id') String get categoryId;@JsonKey(name: 'product_condition') String get productCondition; int get price; String? get currency;@JsonKey(name: 'location_id') String get locationId;@JsonKey(fromJson: _specificationsFromJson) Map<String, dynamic>? get specifications;@JsonKey(name: 'content_status') String get contentStatus;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;// Joined data from Supabase nested select
@JsonKey(name: 'locations') Map<String, dynamic>? get locationData;@JsonKey(name: 'users') Map<String, dynamic>? get sellerData;
/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingModelCopyWith<ListingModel> get copyWith => _$ListingModelCopyWithImpl<ListingModel>(this as ListingModel, _$identity);

  /// Serializes this ListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingModel&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.productCondition, productCondition) || other.productCondition == productCondition)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.locationData, locationData)&&const DeepCollectionEquality().equals(other.sellerData, sellerData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId,sellerId,title,description,categoryId,productCondition,price,currency,locationId,const DeepCollectionEquality().hash(specifications),contentStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(locationData),const DeepCollectionEquality().hash(sellerData));

@override
String toString() {
  return 'ListingModel(listingId: $listingId, sellerId: $sellerId, title: $title, description: $description, categoryId: $categoryId, productCondition: $productCondition, price: $price, currency: $currency, locationId: $locationId, specifications: $specifications, contentStatus: $contentStatus, createdAt: $createdAt, updatedAt: $updatedAt, locationData: $locationData, sellerData: $sellerData)';
}


}

/// @nodoc
abstract mixin class $ListingModelCopyWith<$Res>  {
  factory $ListingModelCopyWith(ListingModel value, $Res Function(ListingModel) _then) = _$ListingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId,@JsonKey(name: 'seller_id') String sellerId, String title, String description,@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'product_condition') String productCondition, int price, String? currency,@JsonKey(name: 'location_id') String locationId,@JsonKey(fromJson: _specificationsFromJson) Map<String, dynamic>? specifications,@JsonKey(name: 'content_status') String contentStatus,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'locations') Map<String, dynamic>? locationData,@JsonKey(name: 'users') Map<String, dynamic>? sellerData
});




}
/// @nodoc
class _$ListingModelCopyWithImpl<$Res>
    implements $ListingModelCopyWith<$Res> {
  _$ListingModelCopyWithImpl(this._self, this._then);

  final ListingModel _self;
  final $Res Function(ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listingId = null,Object? sellerId = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? productCondition = null,Object? price = null,Object? currency = freezed,Object? locationId = null,Object? specifications = freezed,Object? contentStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? locationData = freezed,Object? sellerData = freezed,}) {
  return _then(_self.copyWith(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,productCondition: null == productCondition ? _self.productCondition : productCondition // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,locationData: freezed == locationData ? _self.locationData : locationData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sellerData: freezed == sellerData ? _self.sellerData : sellerData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingModel].
extension ListingModelPatterns on ListingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingModel value)  $default,){
final _that = this;
switch (_that) {
case _ListingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String title,  String description, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'product_condition')  String productCondition,  int price,  String? currency, @JsonKey(name: 'location_id')  String locationId, @JsonKey(fromJson: _specificationsFromJson)  Map<String, dynamic>? specifications, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'locations')  Map<String, dynamic>? locationData, @JsonKey(name: 'users')  Map<String, dynamic>? sellerData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.listingId,_that.sellerId,_that.title,_that.description,_that.categoryId,_that.productCondition,_that.price,_that.currency,_that.locationId,_that.specifications,_that.contentStatus,_that.createdAt,_that.updatedAt,_that.locationData,_that.sellerData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String title,  String description, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'product_condition')  String productCondition,  int price,  String? currency, @JsonKey(name: 'location_id')  String locationId, @JsonKey(fromJson: _specificationsFromJson)  Map<String, dynamic>? specifications, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'locations')  Map<String, dynamic>? locationData, @JsonKey(name: 'users')  Map<String, dynamic>? sellerData)  $default,) {final _that = this;
switch (_that) {
case _ListingModel():
return $default(_that.listingId,_that.sellerId,_that.title,_that.description,_that.categoryId,_that.productCondition,_that.price,_that.currency,_that.locationId,_that.specifications,_that.contentStatus,_that.createdAt,_that.updatedAt,_that.locationData,_that.sellerData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String title,  String description, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'product_condition')  String productCondition,  int price,  String? currency, @JsonKey(name: 'location_id')  String locationId, @JsonKey(fromJson: _specificationsFromJson)  Map<String, dynamic>? specifications, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'locations')  Map<String, dynamic>? locationData, @JsonKey(name: 'users')  Map<String, dynamic>? sellerData)?  $default,) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.listingId,_that.sellerId,_that.title,_that.description,_that.categoryId,_that.productCondition,_that.price,_that.currency,_that.locationId,_that.specifications,_that.contentStatus,_that.createdAt,_that.updatedAt,_that.locationData,_that.sellerData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingModel extends ListingModel {
  const _ListingModel({@JsonKey(name: 'listing_id') required this.listingId, @JsonKey(name: 'seller_id') required this.sellerId, required this.title, required this.description, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'product_condition') required this.productCondition, required this.price, this.currency, @JsonKey(name: 'location_id') required this.locationId, @JsonKey(fromJson: _specificationsFromJson) final  Map<String, dynamic>? specifications, @JsonKey(name: 'content_status') required this.contentStatus, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'locations') final  Map<String, dynamic>? locationData, @JsonKey(name: 'users') final  Map<String, dynamic>? sellerData}): _specifications = specifications,_locationData = locationData,_sellerData = sellerData,super._();
  factory _ListingModel.fromJson(Map<String, dynamic> json) => _$ListingModelFromJson(json);

@override@JsonKey(name: 'listing_id') final  String listingId;
@override@JsonKey(name: 'seller_id') final  String sellerId;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override@JsonKey(name: 'product_condition') final  String productCondition;
@override final  int price;
@override final  String? currency;
@override@JsonKey(name: 'location_id') final  String locationId;
 final  Map<String, dynamic>? _specifications;
@override@JsonKey(fromJson: _specificationsFromJson) Map<String, dynamic>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableMapView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'content_status') final  String contentStatus;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
// Joined data from Supabase nested select
 final  Map<String, dynamic>? _locationData;
// Joined data from Supabase nested select
@override@JsonKey(name: 'locations') Map<String, dynamic>? get locationData {
  final value = _locationData;
  if (value == null) return null;
  if (_locationData is EqualUnmodifiableMapView) return _locationData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _sellerData;
@override@JsonKey(name: 'users') Map<String, dynamic>? get sellerData {
  final value = _sellerData;
  if (value == null) return null;
  if (_sellerData is EqualUnmodifiableMapView) return _sellerData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingModelCopyWith<_ListingModel> get copyWith => __$ListingModelCopyWithImpl<_ListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingModel&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.productCondition, productCondition) || other.productCondition == productCondition)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._locationData, _locationData)&&const DeepCollectionEquality().equals(other._sellerData, _sellerData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId,sellerId,title,description,categoryId,productCondition,price,currency,locationId,const DeepCollectionEquality().hash(_specifications),contentStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(_locationData),const DeepCollectionEquality().hash(_sellerData));

@override
String toString() {
  return 'ListingModel(listingId: $listingId, sellerId: $sellerId, title: $title, description: $description, categoryId: $categoryId, productCondition: $productCondition, price: $price, currency: $currency, locationId: $locationId, specifications: $specifications, contentStatus: $contentStatus, createdAt: $createdAt, updatedAt: $updatedAt, locationData: $locationData, sellerData: $sellerData)';
}


}

/// @nodoc
abstract mixin class _$ListingModelCopyWith<$Res> implements $ListingModelCopyWith<$Res> {
  factory _$ListingModelCopyWith(_ListingModel value, $Res Function(_ListingModel) _then) = __$ListingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId,@JsonKey(name: 'seller_id') String sellerId, String title, String description,@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'product_condition') String productCondition, int price, String? currency,@JsonKey(name: 'location_id') String locationId,@JsonKey(fromJson: _specificationsFromJson) Map<String, dynamic>? specifications,@JsonKey(name: 'content_status') String contentStatus,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'locations') Map<String, dynamic>? locationData,@JsonKey(name: 'users') Map<String, dynamic>? sellerData
});




}
/// @nodoc
class __$ListingModelCopyWithImpl<$Res>
    implements _$ListingModelCopyWith<$Res> {
  __$ListingModelCopyWithImpl(this._self, this._then);

  final _ListingModel _self;
  final $Res Function(_ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listingId = null,Object? sellerId = null,Object? title = null,Object? description = null,Object? categoryId = null,Object? productCondition = null,Object? price = null,Object? currency = freezed,Object? locationId = null,Object? specifications = freezed,Object? contentStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? locationData = freezed,Object? sellerData = freezed,}) {
  return _then(_ListingModel(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,productCondition: null == productCondition ? _self.productCondition : productCondition // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,locationData: freezed == locationData ? _self._locationData : locationData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sellerData: freezed == sellerData ? _self._sellerData : sellerData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
