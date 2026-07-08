// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReelInfo {

 ReelID get id; String get videoUrl; String? get title; String? get titleSub;
/// Create a copy of ReelInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReelInfoCopyWith<ReelInfo> get copyWith => _$ReelInfoCopyWithImpl<ReelInfo>(this as ReelInfo, _$identity);

  /// Serializes this ReelInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReelInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleSub, titleSub) || other.titleSub == titleSub));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,videoUrl,title,titleSub);

@override
String toString() {
  return 'ReelInfo(id: $id, videoUrl: $videoUrl, title: $title, titleSub: $titleSub)';
}


}

/// @nodoc
abstract mixin class $ReelInfoCopyWith<$Res>  {
  factory $ReelInfoCopyWith(ReelInfo value, $Res Function(ReelInfo) _then) = _$ReelInfoCopyWithImpl;
@useResult
$Res call({
 ReelID id, String videoUrl, String? title, String? titleSub
});




}
/// @nodoc
class _$ReelInfoCopyWithImpl<$Res>
    implements $ReelInfoCopyWith<$Res> {
  _$ReelInfoCopyWithImpl(this._self, this._then);

  final ReelInfo _self;
  final $Res Function(ReelInfo) _then;

/// Create a copy of ReelInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? videoUrl = null,Object? title = freezed,Object? titleSub = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as ReelID,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleSub: freezed == titleSub ? _self.titleSub : titleSub // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReelInfo].
extension ReelInfoPatterns on ReelInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReelInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReelInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReelInfo value)  $default,){
final _that = this;
switch (_that) {
case _ReelInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReelInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ReelInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReelID id,  String videoUrl,  String? title,  String? titleSub)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReelInfo() when $default != null:
return $default(_that.id,_that.videoUrl,_that.title,_that.titleSub);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReelID id,  String videoUrl,  String? title,  String? titleSub)  $default,) {final _that = this;
switch (_that) {
case _ReelInfo():
return $default(_that.id,_that.videoUrl,_that.title,_that.titleSub);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReelID id,  String videoUrl,  String? title,  String? titleSub)?  $default,) {final _that = this;
switch (_that) {
case _ReelInfo() when $default != null:
return $default(_that.id,_that.videoUrl,_that.title,_that.titleSub);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReelInfo implements ReelInfo {
  const _ReelInfo({required this.id, required this.videoUrl, this.title, this.titleSub});
  factory _ReelInfo.fromJson(Map<String, dynamic> json) => _$ReelInfoFromJson(json);

@override final  ReelID id;
@override final  String videoUrl;
@override final  String? title;
@override final  String? titleSub;

/// Create a copy of ReelInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReelInfoCopyWith<_ReelInfo> get copyWith => __$ReelInfoCopyWithImpl<_ReelInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReelInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReelInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleSub, titleSub) || other.titleSub == titleSub));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,videoUrl,title,titleSub);

@override
String toString() {
  return 'ReelInfo(id: $id, videoUrl: $videoUrl, title: $title, titleSub: $titleSub)';
}


}

/// @nodoc
abstract mixin class _$ReelInfoCopyWith<$Res> implements $ReelInfoCopyWith<$Res> {
  factory _$ReelInfoCopyWith(_ReelInfo value, $Res Function(_ReelInfo) _then) = __$ReelInfoCopyWithImpl;
@override @useResult
$Res call({
 ReelID id, String videoUrl, String? title, String? titleSub
});




}
/// @nodoc
class __$ReelInfoCopyWithImpl<$Res>
    implements _$ReelInfoCopyWith<$Res> {
  __$ReelInfoCopyWithImpl(this._self, this._then);

  final _ReelInfo _self;
  final $Res Function(_ReelInfo) _then;

/// Create a copy of ReelInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? videoUrl = null,Object? title = freezed,Object? titleSub = freezed,}) {
  return _then(_ReelInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as ReelID,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleSub: freezed == titleSub ? _self.titleSub : titleSub // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
