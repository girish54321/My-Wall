enum UnSplashAPIPath { home, users, token, topics, search, getSelectedImage }

class UnSplashAPIPathHelper {
  static String getValue(UnSplashAPIPath path) {
    switch (path) {
      case UnSplashAPIPath.home:
        return "/photos";
      case UnSplashAPIPath.getSelectedImage:
        return "/photos/";
      case UnSplashAPIPath.topics:
        return "/topics";
      case UnSplashAPIPath.users:
        return "/users";
      case UnSplashAPIPath.token:
        return "oauth/token";
      case UnSplashAPIPath.search:
        return "/search/photos";
      default:
        return "";
    }
  }
}
