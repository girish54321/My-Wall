enum Flavor {
  MYWALL,
  MYWALL_DEV,
  MYWALL_QA,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.MYWALL:
        return 'My Wall';
      case Flavor.MYWALL_DEV:
        return 'My Wall DEV';
      case Flavor.MYWALL_QA:
        return 'My Wall QA';
      default:
        return 'title';
    }
  }

}
