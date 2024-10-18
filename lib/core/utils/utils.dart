import 'package:medex/core/utils/configuration.dart';

/// This determines how many items can fit in the width,
/// rounded down to ensure full items without clipping.
int getGridViewCrossAxisCount(double maxWidth, double itemWidth) {
  var count = (maxWidth / itemWidth).floor();

  if (count == 0) {
    return 1;
  }

  return count;
}

T uiOrientedSwitch<T>(T mobile, T desktop) {
  return Configuration().isMobile ? mobile : desktop;
}
