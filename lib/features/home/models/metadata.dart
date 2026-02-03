import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
abstract class GalleriaMetadata with _$GalleriaMetadata {
  const factory GalleriaMetadata({
    required String localId,
    required String originalName,
    required String uploadedAt,
    DateTime? takenAt,
    double? latitude,
    double? longitude,
    String? address,
    String? localPath,
  }) = _GalleriaMetadata;

  factory GalleriaMetadata.fromJson(Map<String, dynamic> json) => _$GalleriaMetadataFromJson(json);
}

extension GalleriaMetadataX on GalleriaMetadata {
  Map<String, String> toSupabaseMetadata() {
    return {
      'localId': localId,
      'originalName': originalName,
      'uploadedAt': uploadedAt,
      if (takenAt != null) 'takenAt': takenAt!.toIso8601String(),
      if (latitude != null) 'latitude': latitude.toString(),
      if (longitude != null) 'longitude': longitude.toString(),
      if (address != null) 'address': address!,
      if (localPath != null) 'localPath': localPath!,
    };
  }
}
