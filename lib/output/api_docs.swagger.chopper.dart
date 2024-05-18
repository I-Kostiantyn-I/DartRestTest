// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_docs.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiDocs extends ApiDocs {
  _$ApiDocs([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiDocs;

  @override
  Future<Response<List<Breed>>> _breedsGet({int? limit}) {
    final Uri $url = Uri.parse('/breeds');
    final Map<String, dynamic> $params = <String, dynamic>{'limit': limit};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<Breed>, Breed>($request);
  }

  @override
  Future<Response<CatFact>> _factGet({int? maxLength}) {
    final Uri $url = Uri.parse('/fact');
    final Map<String, dynamic> $params = <String, dynamic>{
      'max_length': maxLength
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CatFact, CatFact>($request);
  }

  @override
  Future<Response<List<CatFact>>> _factsGet({
    int? maxLength,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/facts');
    final Map<String, dynamic> $params = <String, dynamic>{
      'max_length': maxLength,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<CatFact>, CatFact>($request);
  }
}
