import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grit_soft_feed_reel/core/typedefs.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class ReelInfo with _$ReelInfo {
  const factory ReelInfo({
    required ReelID id,
    required String videoUrl,
    String? title,
    String? titleSub,
  }) = _ReelInfo;

  factory ReelInfo.fromJson(Map<String, dynamic> json) =>
      _$ReelInfoFromJson(json);
}
