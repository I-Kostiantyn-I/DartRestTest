// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;

part 'api_docs.swagger.chopper.dart';
part 'api_docs.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiDocs extends ChopperService {
  static ApiDocs create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$ApiDocs(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiDocs()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$ApiDocs(newClient);
  }

  ///Get a list of breeds
  ///@param limit limit the amount of results returned
  Future<chopper.Response<List<Breed>>> breedsGet({int? limit}) {
    generatedMapping.putIfAbsent(Breed, () => Breed.fromJsonFactory);

    return _breedsGet(limit: limit);
  }

  ///Get a list of breeds
  ///@param limit limit the amount of results returned
  @Get(path: '/breeds')
  Future<chopper.Response<List<Breed>>> _breedsGet(
      {@Query('limit') int? limit});

  ///Get Random Fact
  ///@param max_length maximum length of returned fact
  Future<chopper.Response<CatFact>> factGet({int? maxLength}) {
    generatedMapping.putIfAbsent(CatFact, () => CatFact.fromJsonFactory);

    return _factGet(maxLength: maxLength);
  }

  ///Get Random Fact
  ///@param max_length maximum length of returned fact
  @Get(path: '/fact')
  Future<chopper.Response<CatFact>> _factGet(
      {@Query('max_length') int? maxLength});

  ///Get a list of facts
  ///@param max_length maximum length of returned fact
  ///@param limit limit the amount of results returned
  Future<chopper.Response<List<CatFact>>> factsGet({
    int? maxLength,
    int? limit,
  }) {
    generatedMapping.putIfAbsent(CatFact, () => CatFact.fromJsonFactory);

    return _factsGet(maxLength: maxLength, limit: limit);
  }

  ///Get a list of facts
  ///@param max_length maximum length of returned fact
  ///@param limit limit the amount of results returned
  @Get(path: '/facts')
  Future<chopper.Response<List<CatFact>>> _factsGet({
    @Query('max_length') int? maxLength,
    @Query('limit') int? limit,
  });
}

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

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

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
