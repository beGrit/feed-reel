import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'builders.freezed.dart';

typedef ReelInfoBuilder = Widget Function(BuildContext);
typedef ReelActionBuilder = Widget Function(BuildContext);
typedef ReelModalBottomSheetContentBuilder = Widget Function(BuildContext);

@freezed
abstract class Builders with _$Builders {
  const factory Builders({
    ReelInfoBuilder? infoBuilderPortrait,
    ReelInfoBuilder? infoBuilderlandscape,
    ReelActionBuilder? actionBuilderPortrait,
    ReelActionBuilder? actionBuilderlandscape,
  }) = _Builders;

  const Builders._();
}
