// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoState implements DiagnosticableTreeMixin {

 bool get isPlaying; bool get isInitialized; bool get initFailed; bool get isBuffering; Duration get lastPosition; DateTime get lastPositionUpdateTime; bool get isStuck;
/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoStateCopyWith<VideoState> get copyWith => _$VideoStateCopyWithImpl<VideoState>(this as VideoState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VideoState'))
    ..add(DiagnosticsProperty('isPlaying', isPlaying))..add(DiagnosticsProperty('isInitialized', isInitialized))..add(DiagnosticsProperty('initFailed', initFailed))..add(DiagnosticsProperty('isBuffering', isBuffering))..add(DiagnosticsProperty('lastPosition', lastPosition))..add(DiagnosticsProperty('lastPositionUpdateTime', lastPositionUpdateTime))..add(DiagnosticsProperty('isStuck', isStuck));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.initFailed, initFailed) || other.initFailed == initFailed)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.lastPosition, lastPosition) || other.lastPosition == lastPosition)&&(identical(other.lastPositionUpdateTime, lastPositionUpdateTime) || other.lastPositionUpdateTime == lastPositionUpdateTime)&&(identical(other.isStuck, isStuck) || other.isStuck == isStuck));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,isInitialized,initFailed,isBuffering,lastPosition,lastPositionUpdateTime,isStuck);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VideoState(isPlaying: $isPlaying, isInitialized: $isInitialized, initFailed: $initFailed, isBuffering: $isBuffering, lastPosition: $lastPosition, lastPositionUpdateTime: $lastPositionUpdateTime, isStuck: $isStuck)';
}


}

/// @nodoc
abstract mixin class $VideoStateCopyWith<$Res>  {
  factory $VideoStateCopyWith(VideoState value, $Res Function(VideoState) _then) = _$VideoStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, bool isInitialized, bool initFailed, bool isBuffering, Duration lastPosition, DateTime lastPositionUpdateTime, bool isStuck
});




}
/// @nodoc
class _$VideoStateCopyWithImpl<$Res>
    implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._self, this._then);

  final VideoState _self;
  final $Res Function(VideoState) _then;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? isInitialized = null,Object? initFailed = null,Object? isBuffering = null,Object? lastPosition = null,Object? lastPositionUpdateTime = null,Object? isStuck = null,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,initFailed: null == initFailed ? _self.initFailed : initFailed // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,lastPosition: null == lastPosition ? _self.lastPosition : lastPosition // ignore: cast_nullable_to_non_nullable
as Duration,lastPositionUpdateTime: null == lastPositionUpdateTime ? _self.lastPositionUpdateTime : lastPositionUpdateTime // ignore: cast_nullable_to_non_nullable
as DateTime,isStuck: null == isStuck ? _self.isStuck : isStuck // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoState].
extension VideoStatePatterns on VideoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoState value)  $default,){
final _that = this;
switch (_that) {
case _VideoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoState value)?  $default,){
final _that = this;
switch (_that) {
case _VideoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  bool isInitialized,  bool initFailed,  bool isBuffering,  Duration lastPosition,  DateTime lastPositionUpdateTime,  bool isStuck)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoState() when $default != null:
return $default(_that.isPlaying,_that.isInitialized,_that.initFailed,_that.isBuffering,_that.lastPosition,_that.lastPositionUpdateTime,_that.isStuck);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  bool isInitialized,  bool initFailed,  bool isBuffering,  Duration lastPosition,  DateTime lastPositionUpdateTime,  bool isStuck)  $default,) {final _that = this;
switch (_that) {
case _VideoState():
return $default(_that.isPlaying,_that.isInitialized,_that.initFailed,_that.isBuffering,_that.lastPosition,_that.lastPositionUpdateTime,_that.isStuck);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  bool isInitialized,  bool initFailed,  bool isBuffering,  Duration lastPosition,  DateTime lastPositionUpdateTime,  bool isStuck)?  $default,) {final _that = this;
switch (_that) {
case _VideoState() when $default != null:
return $default(_that.isPlaying,_that.isInitialized,_that.initFailed,_that.isBuffering,_that.lastPosition,_that.lastPositionUpdateTime,_that.isStuck);case _:
  return null;

}
}

}

/// @nodoc


class _VideoState extends VideoState with DiagnosticableTreeMixin {
  const _VideoState({this.isPlaying = false, this.isInitialized = false, this.initFailed = false, this.isBuffering = false, this.lastPosition = Duration.zero, required this.lastPositionUpdateTime, this.isStuck = false}): super._();
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  bool isInitialized;
@override@JsonKey() final  bool initFailed;
@override@JsonKey() final  bool isBuffering;
@override@JsonKey() final  Duration lastPosition;
@override final  DateTime lastPositionUpdateTime;
@override@JsonKey() final  bool isStuck;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoStateCopyWith<_VideoState> get copyWith => __$VideoStateCopyWithImpl<_VideoState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VideoState'))
    ..add(DiagnosticsProperty('isPlaying', isPlaying))..add(DiagnosticsProperty('isInitialized', isInitialized))..add(DiagnosticsProperty('initFailed', initFailed))..add(DiagnosticsProperty('isBuffering', isBuffering))..add(DiagnosticsProperty('lastPosition', lastPosition))..add(DiagnosticsProperty('lastPositionUpdateTime', lastPositionUpdateTime))..add(DiagnosticsProperty('isStuck', isStuck));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.initFailed, initFailed) || other.initFailed == initFailed)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering)&&(identical(other.lastPosition, lastPosition) || other.lastPosition == lastPosition)&&(identical(other.lastPositionUpdateTime, lastPositionUpdateTime) || other.lastPositionUpdateTime == lastPositionUpdateTime)&&(identical(other.isStuck, isStuck) || other.isStuck == isStuck));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,isInitialized,initFailed,isBuffering,lastPosition,lastPositionUpdateTime,isStuck);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VideoState(isPlaying: $isPlaying, isInitialized: $isInitialized, initFailed: $initFailed, isBuffering: $isBuffering, lastPosition: $lastPosition, lastPositionUpdateTime: $lastPositionUpdateTime, isStuck: $isStuck)';
}


}

/// @nodoc
abstract mixin class _$VideoStateCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
  factory _$VideoStateCopyWith(_VideoState value, $Res Function(_VideoState) _then) = __$VideoStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, bool isInitialized, bool initFailed, bool isBuffering, Duration lastPosition, DateTime lastPositionUpdateTime, bool isStuck
});




}
/// @nodoc
class __$VideoStateCopyWithImpl<$Res>
    implements _$VideoStateCopyWith<$Res> {
  __$VideoStateCopyWithImpl(this._self, this._then);

  final _VideoState _self;
  final $Res Function(_VideoState) _then;

/// Create a copy of VideoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? isInitialized = null,Object? initFailed = null,Object? isBuffering = null,Object? lastPosition = null,Object? lastPositionUpdateTime = null,Object? isStuck = null,}) {
  return _then(_VideoState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,initFailed: null == initFailed ? _self.initFailed : initFailed // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,lastPosition: null == lastPosition ? _self.lastPosition : lastPosition // ignore: cast_nullable_to_non_nullable
as Duration,lastPositionUpdateTime: null == lastPositionUpdateTime ? _self.lastPositionUpdateTime : lastPositionUpdateTime // ignore: cast_nullable_to_non_nullable
as DateTime,isStuck: null == isStuck ? _self.isStuck : isStuck // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$OrientationState implements DiagnosticableTreeMixin {

 Orientation get orientation; Orientation? get prevOrientation;
/// Create a copy of OrientationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrientationStateCopyWith<OrientationState> get copyWith => _$OrientationStateCopyWithImpl<OrientationState>(this as OrientationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrientationState'))
    ..add(DiagnosticsProperty('orientation', orientation))..add(DiagnosticsProperty('prevOrientation', prevOrientation));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrientationState&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.prevOrientation, prevOrientation) || other.prevOrientation == prevOrientation));
}


@override
int get hashCode => Object.hash(runtimeType,orientation,prevOrientation);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrientationState(orientation: $orientation, prevOrientation: $prevOrientation)';
}


}

/// @nodoc
abstract mixin class $OrientationStateCopyWith<$Res>  {
  factory $OrientationStateCopyWith(OrientationState value, $Res Function(OrientationState) _then) = _$OrientationStateCopyWithImpl;
@useResult
$Res call({
 Orientation orientation, Orientation? prevOrientation
});




}
/// @nodoc
class _$OrientationStateCopyWithImpl<$Res>
    implements $OrientationStateCopyWith<$Res> {
  _$OrientationStateCopyWithImpl(this._self, this._then);

  final OrientationState _self;
  final $Res Function(OrientationState) _then;

/// Create a copy of OrientationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orientation = null,Object? prevOrientation = freezed,}) {
  return _then(_self.copyWith(
orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as Orientation,prevOrientation: freezed == prevOrientation ? _self.prevOrientation : prevOrientation // ignore: cast_nullable_to_non_nullable
as Orientation?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrientationState].
extension OrientationStatePatterns on OrientationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrientationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrientationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrientationState value)  $default,){
final _that = this;
switch (_that) {
case _OrientationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrientationState value)?  $default,){
final _that = this;
switch (_that) {
case _OrientationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Orientation orientation,  Orientation? prevOrientation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrientationState() when $default != null:
return $default(_that.orientation,_that.prevOrientation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Orientation orientation,  Orientation? prevOrientation)  $default,) {final _that = this;
switch (_that) {
case _OrientationState():
return $default(_that.orientation,_that.prevOrientation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Orientation orientation,  Orientation? prevOrientation)?  $default,) {final _that = this;
switch (_that) {
case _OrientationState() when $default != null:
return $default(_that.orientation,_that.prevOrientation);case _:
  return null;

}
}

}

/// @nodoc


class _OrientationState extends OrientationState with DiagnosticableTreeMixin {
  const _OrientationState({this.orientation = Orientation.portrait, this.prevOrientation}): super._();
  

@override@JsonKey() final  Orientation orientation;
@override final  Orientation? prevOrientation;

/// Create a copy of OrientationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrientationStateCopyWith<_OrientationState> get copyWith => __$OrientationStateCopyWithImpl<_OrientationState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrientationState'))
    ..add(DiagnosticsProperty('orientation', orientation))..add(DiagnosticsProperty('prevOrientation', prevOrientation));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrientationState&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.prevOrientation, prevOrientation) || other.prevOrientation == prevOrientation));
}


@override
int get hashCode => Object.hash(runtimeType,orientation,prevOrientation);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrientationState(orientation: $orientation, prevOrientation: $prevOrientation)';
}


}

/// @nodoc
abstract mixin class _$OrientationStateCopyWith<$Res> implements $OrientationStateCopyWith<$Res> {
  factory _$OrientationStateCopyWith(_OrientationState value, $Res Function(_OrientationState) _then) = __$OrientationStateCopyWithImpl;
@override @useResult
$Res call({
 Orientation orientation, Orientation? prevOrientation
});




}
/// @nodoc
class __$OrientationStateCopyWithImpl<$Res>
    implements _$OrientationStateCopyWith<$Res> {
  __$OrientationStateCopyWithImpl(this._self, this._then);

  final _OrientationState _self;
  final $Res Function(_OrientationState) _then;

/// Create a copy of OrientationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orientation = null,Object? prevOrientation = freezed,}) {
  return _then(_OrientationState(
orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as Orientation,prevOrientation: freezed == prevOrientation ? _self.prevOrientation : prevOrientation // ignore: cast_nullable_to_non_nullable
as Orientation?,
  ));
}


}

/// @nodoc
mixin _$ModalState implements DiagnosticableTreeMixin {

 bool get isShowing;
/// Create a copy of ModalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalStateCopyWith<ModalState> get copyWith => _$ModalStateCopyWithImpl<ModalState>(this as ModalState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ModalState'))
    ..add(DiagnosticsProperty('isShowing', isShowing));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModalState&&(identical(other.isShowing, isShowing) || other.isShowing == isShowing));
}


@override
int get hashCode => Object.hash(runtimeType,isShowing);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ModalState(isShowing: $isShowing)';
}


}

/// @nodoc
abstract mixin class $ModalStateCopyWith<$Res>  {
  factory $ModalStateCopyWith(ModalState value, $Res Function(ModalState) _then) = _$ModalStateCopyWithImpl;
@useResult
$Res call({
 bool isShowing
});




}
/// @nodoc
class _$ModalStateCopyWithImpl<$Res>
    implements $ModalStateCopyWith<$Res> {
  _$ModalStateCopyWithImpl(this._self, this._then);

  final ModalState _self;
  final $Res Function(ModalState) _then;

/// Create a copy of ModalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isShowing = null,}) {
  return _then(_self.copyWith(
isShowing: null == isShowing ? _self.isShowing : isShowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ModalState].
extension ModalStatePatterns on ModalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModalState value)  $default,){
final _that = this;
switch (_that) {
case _ModalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModalState value)?  $default,){
final _that = this;
switch (_that) {
case _ModalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isShowing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModalState() when $default != null:
return $default(_that.isShowing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isShowing)  $default,) {final _that = this;
switch (_that) {
case _ModalState():
return $default(_that.isShowing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isShowing)?  $default,) {final _that = this;
switch (_that) {
case _ModalState() when $default != null:
return $default(_that.isShowing);case _:
  return null;

}
}

}

/// @nodoc


class _ModalState extends ModalState with DiagnosticableTreeMixin {
  const _ModalState({this.isShowing = false}): super._();
  

@override@JsonKey() final  bool isShowing;

/// Create a copy of ModalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalStateCopyWith<_ModalState> get copyWith => __$ModalStateCopyWithImpl<_ModalState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ModalState'))
    ..add(DiagnosticsProperty('isShowing', isShowing));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModalState&&(identical(other.isShowing, isShowing) || other.isShowing == isShowing));
}


@override
int get hashCode => Object.hash(runtimeType,isShowing);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ModalState(isShowing: $isShowing)';
}


}

/// @nodoc
abstract mixin class _$ModalStateCopyWith<$Res> implements $ModalStateCopyWith<$Res> {
  factory _$ModalStateCopyWith(_ModalState value, $Res Function(_ModalState) _then) = __$ModalStateCopyWithImpl;
@override @useResult
$Res call({
 bool isShowing
});




}
/// @nodoc
class __$ModalStateCopyWithImpl<$Res>
    implements _$ModalStateCopyWith<$Res> {
  __$ModalStateCopyWithImpl(this._self, this._then);

  final _ModalState _self;
  final $Res Function(_ModalState) _then;

/// Create a copy of ModalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isShowing = null,}) {
  return _then(_ModalState(
isShowing: null == isShowing ? _self.isShowing : isShowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
