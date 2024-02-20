class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    // Router initialization happens here.
  }
}