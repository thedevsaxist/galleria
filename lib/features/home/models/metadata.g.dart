// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GalleriaMetadata _$GalleriaMetadataFromJson(Map<String, dynamic> json) =>
    _GalleriaMetadata(
      localId: json['localId'] as String,
      originalName: json['originalName'] as String,
      uploadedAt: json['uploadedAt'] as String,
      takenAt: json['takenAt'] == null
          ? null
          : DateTime.parse(json['takenAt'] as String),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      localPath: json['localPath'] as String?,
    );

Map<String, dynamic> _$GalleriaMetadataToJson(_GalleriaMetadata instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'originalName': instance.originalName,
      'uploadedAt': instance.uploadedAt,
      'takenAt': instance.takenAt?.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'localPath': instance.localPath,
    };
