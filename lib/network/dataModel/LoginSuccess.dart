///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginSuccess {
/*
{
  "access_token": "091343ce13c8ae780065ecb3b13dc903475dd22cb78a05503c2e0c69c5e98044",
  "token_type": "bearer",
  "scope": "public read_photos write_photos",
  "created_at": 1436544465
} 
*/

  String? accessToken;
  String? tokenType;
  String? scope;
  int? createdAt;
  Map<String, dynamic> __origJson = {};

  LoginSuccess({
    this.accessToken,
    this.tokenType,
    this.scope,
    this.createdAt,
  });
  LoginSuccess.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    accessToken = json['access_token']?.toString();
    tokenType = json['token_type']?.toString();
    scope = json['scope']?.toString();
    createdAt = json['created_at']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['scope'] = scope;
    data['created_at'] = createdAt;
    return data;
  }

  Map<String, dynamic> origJson() => __origJson;
}

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ErrorResponse {
/*
{
  "error": "invalid_request",
  "error_description": "Missing required parameter: code."
} 
*/

  String? error;
  String? errorDescription;
  Map<String, dynamic> __origJson = {};

  ErrorResponse({
    this.error,
    this.errorDescription,
  });
  ErrorResponse.fromJson(Map<String, dynamic> json) {
    __origJson = json;
    error = json['error']?.toString();
    errorDescription = json['error_description']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['error_description'] = errorDescription;
    return data;
  }

  Map<String, dynamic> origJson() => __origJson;
}
