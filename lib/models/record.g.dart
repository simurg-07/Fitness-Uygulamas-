// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      weight: json['weight'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      note: json['note'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'weight': instance.weight,
      'dateTime': instance.dateTime.toIso8601String(),
      'note': instance.note,
      'photoUrl': instance.photoUrl,
    };
