import 'package:flutter/material.dart';

import '../../../main.dart';

final screenSizeNotifier = ValueNotifier(Size.infinite);

mixin ContextMixin {
  BuildContext get currentContext => navigatorKey.currentContext!;
  ThemeData get theme => Theme.of(currentContext);

  double dynamicWidth(double value) => screenSizeNotifier.value.width * value;
  double dynamicHeight(double value) => screenSizeNotifier.value.height * value;
}
