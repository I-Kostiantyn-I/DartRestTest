// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'api_docs.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Breed {
  const Breed({
    this.breed,
    this.country,
    this.origin,
    this.coat,
    this.pattern,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  static const toJsonFactory = _$BreedToJson;
  Map<String, dynamic> toJson() => _$BreedToJson(this);

  @JsonKey(name: 'breed')
  final String? breed;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'origin')
  final String? origin;
  @JsonKey(name: 'coat')
  final String? coat;
  @JsonKey(name: 'pattern')
  final String? pattern;
  static const fromJsonFactory = _$BreedFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Breed &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)) &&
            (identical(other.coat, coat) ||
                const DeepCollectionEquality().equals(other.coat, coat)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality().equals(other.pattern, pattern)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(breed) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(origin) ^
      const DeepCollectionEquality().hash(coat) ^
      const DeepCollectionEquality().hash(pattern) ^
      runtimeType.hashCode;
}

extension $BreedExtension on Breed {
  Breed copyWith(
      {String? breed,
      String? country,
      String? origin,
      String? coat,
      String? pattern}) {
    return Breed(
        breed: breed ?? this.breed,
        country: country ?? this.country,
        origin: origin ?? this.origin,
        coat: coat ?? this.coat,
        pattern: pattern ?? this.pattern);
  }

  Breed copyWithWrapped(
      {Wrapped<String?>? breed,
      Wrapped<String?>? country,
      Wrapped<String?>? origin,
      Wrapped<String?>? coat,
      Wrapped<String?>? pattern}) {
    return Breed(
        breed: (breed != null ? breed.value : this.breed),
        country: (country != null ? country.value : this.country),
        origin: (origin != null ? origin.value : this.origin),
        coat: (coat != null ? coat.value : this.coat),
        pattern: (pattern != null ? pattern.value : this.pattern));
  }
}

@JsonSerializable(explicitToJson: true)
class CatFact {
  const CatFact({
    this.fact,
    this.length,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);

  static const toJsonFactory = _$CatFactToJson;
  Map<String, dynamic> toJson() => _$CatFactToJson(this);

  @JsonKey(name: 'fact')
  final String? fact;
  @JsonKey(name: 'length')
  final int? length;
  static const fromJsonFactory = _$CatFactFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatFact &&
            (identical(other.fact, fact) ||
                const DeepCollectionEquality().equals(other.fact, fact)) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fact) ^
      const DeepCollectionEquality().hash(length) ^
      runtimeType.hashCode;
}

extension $CatFactExtension on CatFact {
  CatFact copyWith({String? fact, int? length}) {
    return CatFact(fact: fact ?? this.fact, length: length ?? this.length);
  }

  CatFact copyWithWrapped({Wrapped<String?>? fact, Wrapped<int?>? length}) {
    return CatFact(
        fact: (fact != null ? fact.value : this.fact),
        length: (length != null ? length.value : this.length));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
