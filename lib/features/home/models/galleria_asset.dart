import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'galleria_asset.freezed.dart';

@freezed
abstract class GalleriaAsset with _$GalleriaAsset {
  const factory GalleriaAsset({required AssetEntity asset, required String id, @Default(false) bool isUploaded}) =
      _GalleriaAsset;
}
