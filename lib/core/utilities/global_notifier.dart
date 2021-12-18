import 'package:flutter/material.dart';

class GlobalNotifier<T> extends ValueNotifier<T> {
  GlobalNotifier(T value) : super(value);

  @override
  T get value => super.value;

  @override
  set value(T newValue) {
    super.value = newValue;
    trigger();
  }

  trigger() => notifyListeners();
}
