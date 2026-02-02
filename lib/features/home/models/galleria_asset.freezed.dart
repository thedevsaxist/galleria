// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'galleria_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleriaAsset {

 AssetEntity get asset; String get id; bool get isUploaded;
/// Create a copy of GalleriaAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleriaAssetCopyWith<GalleriaAsset> get copyWith => _$GalleriaAssetCopyWithImpl<GalleriaAsset>(this as GalleriaAsset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleriaAsset&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.id, id) || other.id == id)&&(identical(other.isUploaded, isUploaded) || other.isUploaded == isUploaded));
}


@override
int get hashCode => Object.hash(runtimeType,asset,id,isUploaded);

@override
String toString() {
  return 'GalleriaAsset(asset: $asset, id: $id, isUploaded: $isUploaded)';
}


}

/// @nodoc
abstract mixin class $GalleriaAssetCopyWith<$Res>  {
  factory $GalleriaAssetCopyWith(GalleriaAsset value, $Res Function(GalleriaAsset) _then) = _$GalleriaAssetCopyWithImpl;
@useResult
$Res call({
 AssetEntity asset, String id, bool isUploaded
});




}
/// @nodoc
class _$GalleriaAssetCopyWithImpl<$Res>
    implements $GalleriaAssetCopyWith<$Res> {
  _$GalleriaAssetCopyWithImpl(this._self, this._then);

  final GalleriaAsset _self;
  final $Res Function(GalleriaAsset) _then;

/// Create a copy of GalleriaAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? asset = null,Object? id = null,Object? isUploaded = null,}) {
  return _then(_self.copyWith(
asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetEntity,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isUploaded: null == isUploaded ? _self.isUploaded : isUploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleriaAsset].
extension GalleriaAssetPatterns on GalleriaAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleriaAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleriaAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleriaAsset value)  $default,){
final _that = this;
switch (_that) {
case _GalleriaAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleriaAsset value)?  $default,){
final _that = this;
switch (_that) {
case _GalleriaAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssetEntity asset,  String id,  bool isUploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleriaAsset() when $default != null:
return $default(_that.asset,_that.id,_that.isUploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssetEntity asset,  String id,  bool isUploaded)  $default,) {final _that = this;
switch (_that) {
case _GalleriaAsset():
return $default(_that.asset,_that.id,_that.isUploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssetEntity asset,  String id,  bool isUploaded)?  $default,) {final _that = this;
switch (_that) {
case _GalleriaAsset() when $default != null:
return $default(_that.asset,_that.id,_that.isUploaded);case _:
  return null;

}
}

}

/// @nodoc


class _GalleriaAsset implements GalleriaAsset {
  const _GalleriaAsset({required this.asset, required this.id, this.isUploaded = false});
  

@override final  AssetEntity asset;
@override final  String id;
@override@JsonKey() final  bool isUploaded;

/// Create a copy of GalleriaAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleriaAssetCopyWith<_GalleriaAsset> get copyWith => __$GalleriaAssetCopyWithImpl<_GalleriaAsset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleriaAsset&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.id, id) || other.id == id)&&(identical(other.isUploaded, isUploaded) || other.isUploaded == isUploaded));
}


@override
int get hashCode => Object.hash(runtimeType,asset,id,isUploaded);

@override
String toString() {
  return 'GalleriaAsset(asset: $asset, id: $id, isUploaded: $isUploaded)';
}


}

/// @nodoc
abstract mixin class _$GalleriaAssetCopyWith<$Res> implements $GalleriaAssetCopyWith<$Res> {
  factory _$GalleriaAssetCopyWith(_GalleriaAsset value, $Res Function(_GalleriaAsset) _then) = __$GalleriaAssetCopyWithImpl;
@override @useResult
$Res call({
 AssetEntity asset, String id, bool isUploaded
});




}
/// @nodoc
class __$GalleriaAssetCopyWithImpl<$Res>
    implements _$GalleriaAssetCopyWith<$Res> {
  __$GalleriaAssetCopyWithImpl(this._self, this._then);

  final _GalleriaAsset _self;
  final $Res Function(_GalleriaAsset) _then;

/// Create a copy of GalleriaAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? asset = null,Object? id = null,Object? isUploaded = null,}) {
  return _then(_GalleriaAsset(
asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetEntity,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isUploaded: null == isUploaded ? _self.isUploaded : isUploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
