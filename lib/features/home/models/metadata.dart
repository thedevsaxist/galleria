import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
abstract class GalleriaMetadata with _$GalleriaMetadata {
  const factory GalleriaMetadata({required String localId, required String originalName, required String uploadedAt}) =
      _GalleriaMetadata;

  factory GalleriaMetadata.fromJson(Map<String, dynamic> json) => _$GalleriaMetadataFromJson(json);
}

extension GalleriaMetadataX on GalleriaMetadata {
  Map<String, String> toSupabaseMetadata() {
    return {'localId': localId, 'originalName': originalName, 'uploadedAt': uploadedAt};
  }
}
