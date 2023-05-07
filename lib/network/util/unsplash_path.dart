enum UnSplashAPIPath { home, users, token, topics }

class UnSplashAPIPathHelper {
  static String getValue(UnSplashAPIPath path) {
    switch (path) {
      case UnSplashAPIPath.home:
        return "/photos";
      case UnSplashAPIPath.topics:
        return "/topics";
      case UnSplashAPIPath.users:
        return "/users";
      case UnSplashAPIPath.token:
        return "oauth/token";
      default:
        return "";
    }
  }
}
