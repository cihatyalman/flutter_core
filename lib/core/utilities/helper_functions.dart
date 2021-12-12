import 'package:flutter/material.dart';

final helperFunctions = HelperFunctions();

class HelperFunctions {
  Future delay([int millisecond = 1000]) async {
    await Future.delayed(Duration(milliseconds: millisecond));
  }

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
  // #endregion

}
