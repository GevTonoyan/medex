class NTapCheck {
  final int n;

  NTapCheck({required this.n});

  var _tapCounter = 0;
  static const int msTapDelta = 250;
  DateTime prevTap = DateTime.now();

  bool _canIncTap() {
    final now = DateTime.now();
    final delta = now.difference(prevTap);
    prevTap = DateTime.now();
    return delta.inMilliseconds < msTapDelta;
  }

  bool isNTap() {
    if (!_canIncTap()) {
      _tapCounter = 0;
      return false;
    }
    ++_tapCounter;

    final result = (_tapCounter == n - 1);
    if (result) {
      _tapCounter = 0;
    }

    return result;
  }
}
