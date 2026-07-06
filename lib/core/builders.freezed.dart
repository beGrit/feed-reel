// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'builders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Builders {

 ReelInfoBuilder? get infoBuilderPortrait; ReelInfoBuilder? get infoBuilderlandscape; ReelActionBuilder? get actionBuilderPortrait; ReelActionBuilder? get actionBuilderlandscape;
/// Create a copy of Builders
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildersCopyWith<Builders> get copyWith => _$BuildersCopyWithImpl<Builders>(this as Builders, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Builders&&(identical(other.infoBuilderPortrait, infoBuilderPortrait) || other.infoBuilderPortrait == infoBuilderPortrait)&&(identical(other.infoBuilderlandscape, infoBuilderlandscape) || other.infoBuilderlandscape == infoBuilderlandscape)&&(identical(other.actionBuilderPortrait, actionBuilderPortrait) || other.actionBuilderPortrait == actionBuilderPortrait)&&(identical(other.actionBuilderlandscape, actionBuilderlandscape) || other.actionBuilderlandscape == actionBuilderlandscape));
}


@override
int get hashCode => Object.hash(runtimeType,infoBuilderPortrait,infoBuilderlandscape,actionBuilderPortrait,actionBuilderlandscape);

@override
String toString() {
  return 'Builders(infoBuilderPortrait: $infoBuilderPortrait, infoBuilderlandscape: $infoBuilderlandscape, actionBuilderPortrait: $actionBuilderPortrait, actionBuilderlandscape: $actionBuilderlandscape)';
}


}

/// @nodoc
abstract mixin class $BuildersCopyWith<$Res>  {
  factory $BuildersCopyWith(Builders value, $Res Function(Builders) _then) = _$BuildersCopyWithImpl;
@useResult
$Res call({
 ReelInfoBuilder? infoBuilderPortrait, ReelInfoBuilder? infoBuilderlandscape, ReelActionBuilder? actionBuilderPortrait, ReelActionBuilder? actionBuilderlandscape
});




}
/// @nodoc
class _$BuildersCopyWithImpl<$Res>
    implements $BuildersCopyWith<$Res> {
  _$BuildersCopyWithImpl(this._self, this._then);

  final Builders _self;
  final $Res Function(Builders) _then;

/// Create a copy of Builders
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? infoBuilderPortrait = freezed,Object? infoBuilderlandscape = freezed,Object? actionBuilderPortrait = freezed,Object? actionBuilderlandscape = freezed,}) {
  return _then(_self.copyWith(
infoBuilderPortrait: freezed == infoBuilderPortrait ? _self.infoBuilderPortrait : infoBuilderPortrait // ignore: cast_nullable_to_non_nullable
as ReelInfoBuilder?,infoBuilderlandscape: freezed == infoBuilderlandscape ? _self.infoBuilderlandscape : infoBuilderlandscape // ignore: cast_nullable_to_non_nullable
as ReelInfoBuilder?,actionBuilderPortrait: freezed == actionBuilderPortrait ? _self.actionBuilderPortrait : actionBuilderPortrait // ignore: cast_nullable_to_non_nullable
as ReelActionBuilder?,actionBuilderlandscape: freezed == actionBuilderlandscape ? _self.actionBuilderlandscape : actionBuilderlandscape // ignore: cast_nullable_to_non_nullable
as ReelActionBuilder?,
  ));
}

}


/// Adds pattern-matching-related methods to [Builders].
extension BuildersPatterns on Builders {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Builders value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Builders() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Builders value)  $default,){
final _that = this;
switch (_that) {
case _Builders():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Builders value)?  $default,){
final _that = this;
switch (_that) {
case _Builders() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReelInfoBuilder? infoBuilderPortrait,  ReelInfoBuilder? infoBuilderlandscape,  ReelActionBuilder? actionBuilderPortrait,  ReelActionBuilder? actionBuilderlandscape)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Builders() when $default != null:
return $default(_that.infoBuilderPortrait,_that.infoBuilderlandscape,_that.actionBuilderPortrait,_that.actionBuilderlandscape);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReelInfoBuilder? infoBuilderPortrait,  ReelInfoBuilder? infoBuilderlandscape,  ReelActionBuilder? actionBuilderPortrait,  ReelActionBuilder? actionBuilderlandscape)  $default,) {final _that = this;
switch (_that) {
case _Builders():
return $default(_that.infoBuilderPortrait,_that.infoBuilderlandscape,_that.actionBuilderPortrait,_that.actionBuilderlandscape);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReelInfoBuilder? infoBuilderPortrait,  ReelInfoBuilder? infoBuilderlandscape,  ReelActionBuilder? actionBuilderPortrait,  ReelActionBuilder? actionBuilderlandscape)?  $default,) {final _that = this;
switch (_that) {
case _Builders() when $default != null:
return $default(_that.infoBuilderPortrait,_that.infoBuilderlandscape,_that.actionBuilderPortrait,_that.actionBuilderlandscape);case _:
  return null;

}
}

}

/// @nodoc


class _Builders extends Builders {
  const _Builders({this.infoBuilderPortrait, this.infoBuilderlandscape, this.actionBuilderPortrait, this.actionBuilderlandscape}): super._();
  

@override final  ReelInfoBuilder? infoBuilderPortrait;
@override final  ReelInfoBuilder? infoBuilderlandscape;
@override final  ReelActionBuilder? actionBuilderPortrait;
@override final  ReelActionBuilder? actionBuilderlandscape;

/// Create a copy of Builders
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildersCopyWith<_Builders> get copyWith => __$BuildersCopyWithImpl<_Builders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Builders&&(identical(other.infoBuilderPortrait, infoBuilderPortrait) || other.infoBuilderPortrait == infoBuilderPortrait)&&(identical(other.infoBuilderlandscape, infoBuilderlandscape) || other.infoBuilderlandscape == infoBuilderlandscape)&&(identical(other.actionBuilderPortrait, actionBuilderPortrait) || other.actionBuilderPortrait == actionBuilderPortrait)&&(identical(other.actionBuilderlandscape, actionBuilderlandscape) || other.actionBuilderlandscape == actionBuilderlandscape));
}


@override
int get hashCode => Object.hash(runtimeType,infoBuilderPortrait,infoBuilderlandscape,actionBuilderPortrait,actionBuilderlandscape);

@override
String toString() {
  return 'Builders(infoBuilderPortrait: $infoBuilderPortrait, infoBuilderlandscape: $infoBuilderlandscape, actionBuilderPortrait: $actionBuilderPortrait, actionBuilderlandscape: $actionBuilderlandscape)';
}


}

/// @nodoc
abstract mixin class _$BuildersCopyWith<$Res> implements $BuildersCopyWith<$Res> {
  factory _$BuildersCopyWith(_Builders value, $Res Function(_Builders) _then) = __$BuildersCopyWithImpl;
@override @useResult
$Res call({
 ReelInfoBuilder? infoBuilderPortrait, ReelInfoBuilder? infoBuilderlandscape, ReelActionBuilder? actionBuilderPortrait, ReelActionBuilder? actionBuilderlandscape
});




}
/// @nodoc
class __$BuildersCopyWithImpl<$Res>
    implements _$BuildersCopyWith<$Res> {
  __$BuildersCopyWithImpl(this._self, this._then);

  final _Builders _self;
  final $Res Function(_Builders) _then;

/// Create a copy of Builders
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? infoBuilderPortrait = freezed,Object? infoBuilderlandscape = freezed,Object? actionBuilderPortrait = freezed,Object? actionBuilderlandscape = freezed,}) {
  return _then(_Builders(
infoBuilderPortrait: freezed == infoBuilderPortrait ? _self.infoBuilderPortrait : infoBuilderPortrait // ignore: cast_nullable_to_non_nullable
as ReelInfoBuilder?,infoBuilderlandscape: freezed == infoBuilderlandscape ? _self.infoBuilderlandscape : infoBuilderlandscape // ignore: cast_nullable_to_non_nullable
as ReelInfoBuilder?,actionBuilderPortrait: freezed == actionBuilderPortrait ? _self.actionBuilderPortrait : actionBuilderPortrait // ignore: cast_nullable_to_non_nullable
as ReelActionBuilder?,actionBuilderlandscape: freezed == actionBuilderlandscape ? _self.actionBuilderlandscape : actionBuilderlandscape // ignore: cast_nullable_to_non_nullable
as ReelActionBuilder?,
  ));
}


}

// dart format on
