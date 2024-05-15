// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_docs.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      breed: json['breed'] as String?,
      country: json['country'] as String?,
      origin: json['origin'] as String?,
      coat: json['coat'] as String?,
      pattern: json['pattern'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'breed': instance.breed,
      'country': instance.country,
      'origin': instance.origin,
      'coat': instance.coat,
      'pattern': instance.pattern,
    };

CatFact _$CatFactFromJson(Map<String, dynamic> json) => CatFact(
      fact: json['fact'] as String?,
      length: (json['length'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CatFactToJson(CatFact instance) => <String, dynamic>{
      'fact': instance.fact,
      'length': instance.length,
    };
