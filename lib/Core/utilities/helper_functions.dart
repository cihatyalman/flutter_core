import 'package:flutter/material.dart';

final HelperFunctions helperFunctions = HelperFunctions();

class HelperFunctions {
  Future delay([int millisecond = 1000]) async {
    await Future.delayed(Duration(milliseconds: millisecond));
  }

  // #region Convert
  String convertTimestamp(DateTime date) {
    return date.millisecondsSinceEpoch
        .toString()
        .substring(0, date.millisecondsSinceEpoch.toString().length - 3);
  }

  DateTime convertDatetime(String timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(timestamp)! * 1000);
  }
  // #endregion

  // #region Actions
  showSnackBar({
    required BuildContext context,
    required String text,
    int millisecond = 3000,
  }) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: millisecond),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  openScene({
    required BuildContext context,
    required String route,
    bool backFeatureActive = false,
    Object? settings,
  }) {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => backFeatureActive
          ? Navigator.pushNamed(context, route, arguments: settings)
          : Navigator.pushNamedAndRemoveUntil(
              context,
              route,
              (Route route) => false,
              arguments: settings,
            ),
    );
  }
  // #endregion

}
