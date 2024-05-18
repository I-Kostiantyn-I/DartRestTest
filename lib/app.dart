import 'package:chopper/chopper.dart';
import 'package:dartresttest/fact_service.dart';
import 'package:dartresttest/output/api_docs.swagger.dart';

void main() async {
  ApiDocs api =
      ApiDocs.create(baseUrl: Uri(scheme: 'https', host: 'catfact.ninja'));

  final response = await api.factsGet();
  print(response.body);
  print(response.statusCode);

  /*final chopper = ChopperClient(
    baseUrl: Uri.parse('https://catfact.ninja'),
    services: [api],
    interceptors: [
      MyRequestInterceptor(),
    ],
    converter: JsonConverter(),
  );

  final response = await api.factsGet();

  if (response.isSuccessful) {
    var jsonFact = response.body;
    print(jsonFact.runtimeType);
    //print(jsonFact.first.runtimeType);
    //if (jsonFact != null) {
    //  print(jsonFactruntimeType);
    //}
  } else {
    print("Failed to fetch data. Error: ${response.error}");
  }

  print(response.body);*/
}

class CatFact {
  static CatFact fromJsonFactory(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
