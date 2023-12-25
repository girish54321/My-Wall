import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'util/nothing.dart';
import 'util/request_type.dart';
import 'util/request_type_exception.dart';

class ReqResClient {
  static const String _baseUrl = "https://api.unsplash.com";
  final Client _client;
  GetStorage box = GetStorage();

  ReqResClient(this._client);

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      String? customBaseUrl,
      Map<String, String>? params,
      dynamic parameter = Nothing}) async {
    //* Check for the Token
    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (box.hasData(JWT_KEY)) 'Authorization': 'Bearer ${box.read(JWT_KEY)}',
    };
    switch (requestType) {
      case RequestType.GET:
        var uri = customBaseUrl ??
            _baseUrl +
                path +
                ((params != null) ? Helper().queryParameters(params) : "");
        return _client.get(
          Uri.parse(uri),
          headers: headers,
        );
      case RequestType.POST:
        var url =
            customBaseUrl != null ? "$customBaseUrl/$path" : "$_baseUrl/$path";
        return _client.post(
            Uri.parse(url +
                ((params != null) ? Helper().queryParameters(params) : "")),
            headers: headers,
            body: json.encode(parameter));
      case RequestType.DELETE:
        return _client.delete(Uri.parse("$_baseUrl/$path"));
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }
}
