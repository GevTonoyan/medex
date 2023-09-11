import 'dart:ui';

class Configuration {
  Configuration._internal();

  static final _instance = Configuration._internal();

  factory Configuration() {
    return _instance;
  }

  /// Saves current size of the available area for application (For performance reason)
  /// Must be updated after every resize
  Size _screenSize = Size.zero;

  Size get screenSize => _screenSize;

  set screenSize(Size value) => _screenSize = value;

  /// Determines if the device is a phone
  bool get isMobile => _screenSize.width < 600;

  /// Determines if the device is a Desktop(Web)
  bool get isDesktop => _screenSize.width > 600;
}
