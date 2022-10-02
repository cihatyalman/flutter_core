import 'package:flutter/material.dart';

import '../../../main.dart';

Size screenSize = Size.infinite;

mixin ContextMixin {
  BuildContext get currentContext => navigatorKey.currentContext!;
  ThemeData get theme => Theme.of(currentContext);

  double dynamicWidth(double value) => screenSize.width * value;
  double dynamicHeight(double value) => screenSize.height * value;
}
