enum AuthAPIPath { login, users, token }

class AuthAPIPathHelper {
  static String getValue(AuthAPIPath path) {
    switch (path) {
      case AuthAPIPath.login:
        return "login";
      case AuthAPIPath.users:
        return "/users";
      case AuthAPIPath.token:
        return "oauth/token";
      default:
        return "";
    }
  }
}
