import 'package:flutter/material.dart';

import '../../../main.dart';

mixin ContextMixin {
  BuildContext get currentContext => navigatorKey.currentContext!;
  MediaQueryData get mediaQuery => MediaQuery.of(currentContext);
  ThemeData get theme => Theme.of(currentContext);

  double dynamicWidth(double value) =>
      MediaQuery.of(currentContext).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(currentContext).size.height * value;
}
