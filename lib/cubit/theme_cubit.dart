import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<bool?> {
  ThemeCubit() : super(null);

  final window = WidgetsBinding.instance.window;

  void onThemeChange() {
    // This callback is called every time the brightness changes.
    window.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;
      emit(brightness == Brightness.dark);
    };
  }
}
