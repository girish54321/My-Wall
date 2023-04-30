import 'package:reqres_app/network/ReqResClient.dart';

const String client_id = "jRBzm2zUw2eoIPSHZxLvY_hnSh0P8J91P2THDay4y8w";
const String redirect_uri = "https://girish54321.github.io/My-Portfolio";
const String response_type = "code";
const String client_secret = "OQjUzWpGQkARf8Nul92eA3jA5CCE5VE-Z4yEGe_vmhQ";
const String auth_URL = "https://unsplash.com";
const String grant_type = "authorization_code";

var parameter = {
  "client_id": client_id,
  "redirect_uri": redirect_uri,
  "response_type": response_type
};

var loginURL =
    "https://unsplash.com/oauth/authorize" + queryParameters(parameter);

String queryParameters(Map<String, String> params) {
  if (params != null) {
    final jsonString = Uri(queryParameters: params);
    return '?${jsonString.query}';
  }
  return '';
}
