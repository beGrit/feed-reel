import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@immutable
@freezed
abstract class VideoState with _$VideoState {
  const factory VideoState({
    @Default(false) bool isPlaying,
    @Default(false) bool isInitialized,
    @Default(false) bool initFailed,
    @Default(false) bool isBuffering,
    @Default(Duration.zero) Duration lastPosition,
    required DateTime lastPositionUpdateTime,
    @Default(false) bool isStuck,
  }) = _VideoState;

  const VideoState._();
}

@immutable
@freezed
abstract class OrientationState with _$OrientationState {
  const factory OrientationState({
    @Default(Orientation.portrait) Orientation orientation,
    Orientation? prevOrientation,
  }) = _OrientationState;

  const OrientationState._();
}

@immutable
@freezed
abstract class ModalState with _$ModalState {
  const factory ModalState({@Default(false) bool isShowing}) = _ModalState;

  const ModalState._();
}
