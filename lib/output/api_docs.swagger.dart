// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'api_docs.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
export 'api_docs.models.swagger.dart';

part 'api_docs.swagger.chopper.dart';

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
