// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleriaMetadata {

 String get localId; String get originalName; String get uploadedAt;
/// Create a copy of GalleriaMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleriaMetadataCopyWith<GalleriaMetadata> get copyWith => _$GalleriaMetadataCopyWithImpl<GalleriaMetadata>(this as GalleriaMetadata, _$identity);

  /// Serializes this GalleriaMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleriaMetadata&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,originalName,uploadedAt);

@override
String toString() {
  return 'GalleriaMetadata(localId: $localId, originalName: $originalName, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $GalleriaMetadataCopyWith<$Res>  {
  factory $GalleriaMetadataCopyWith(GalleriaMetadata value, $Res Function(GalleriaMetadata) _then) = _$GalleriaMetadataCopyWithImpl;
@useResult
$Res call({
 String localId, String originalName, String uploadedAt
});




}
/// @nodoc
class _$GalleriaMetadataCopyWithImpl<$Res>
    implements $GalleriaMetadataCopyWith<$Res> {
  _$GalleriaMetadataCopyWithImpl(this._self, this._then);

  final GalleriaMetadata _self;
  final $Res Function(GalleriaMetadata) _then;

/// Create a copy of GalleriaMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? originalName = null,Object? uploadedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleriaMetadata].
extension GalleriaMetadataPatterns on GalleriaMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleriaMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleriaMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleriaMetadata value)  $default,){
final _that = this;
switch (_that) {
case _GalleriaMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleriaMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _GalleriaMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  String originalName,  String uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleriaMetadata() when $default != null:
return $default(_that.localId,_that.originalName,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  String originalName,  String uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _GalleriaMetadata():
return $default(_that.localId,_that.originalName,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  String originalName,  String uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _GalleriaMetadata() when $default != null:
return $default(_that.localId,_that.originalName,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GalleriaMetadata implements GalleriaMetadata {
  const _GalleriaMetadata({required this.localId, required this.originalName, required this.uploadedAt});
  factory _GalleriaMetadata.fromJson(Map<String, dynamic> json) => _$GalleriaMetadataFromJson(json);

@override final  String localId;
@override final  String originalName;
@override final  String uploadedAt;

/// Create a copy of GalleriaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleriaMetadataCopyWith<_GalleriaMetadata> get copyWith => __$GalleriaMetadataCopyWithImpl<_GalleriaMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GalleriaMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleriaMetadata&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,originalName,uploadedAt);

@override
String toString() {
  return 'GalleriaMetadata(localId: $localId, originalName: $originalName, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$GalleriaMetadataCopyWith<$Res> implements $GalleriaMetadataCopyWith<$Res> {
  factory _$GalleriaMetadataCopyWith(_GalleriaMetadata value, $Res Function(_GalleriaMetadata) _then) = __$GalleriaMetadataCopyWithImpl;
@override @useResult
$Res call({
 String localId, String originalName, String uploadedAt
});




}
/// @nodoc
class __$GalleriaMetadataCopyWithImpl<$Res>
    implements _$GalleriaMetadataCopyWith<$Res> {
  __$GalleriaMetadataCopyWithImpl(this._self, this._then);

  final _GalleriaMetadata _self;
  final $Res Function(_GalleriaMetadata) _then;

/// Create a copy of GalleriaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? originalName = null,Object? uploadedAt = null,}) {
  return _then(_GalleriaMetadata(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
