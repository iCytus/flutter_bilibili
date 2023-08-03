
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../config/custom_colors.dart';

part 'custom_theme_state.dart';

class CustomThemeCubit extends HydratedCubit<CustomThemeMode> {

  CustomThemeCubit() : super(CustomThemeMode.system);

  void updateTheme(CustomThemeMode themeMode) => emit(themeMode);
  // This handles the restoration of the theme mode when the app is restarted.
  @override
  CustomThemeMode? fromJson(Map<String, dynamic> json) {
    final theme = json['CustomThemeMode'];
    switch (theme) {
      case 'CustomThemeMode.system':
        return CustomThemeMode.system;
      case 'CustomThemeMode.light':
        return CustomThemeMode.light;
      case 'CustomThemeMode.dark':
        return CustomThemeMode.dark;
      case 'CustomThemeMode.pink':
        return CustomThemeMode.pink;
    }

    return CustomThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(CustomThemeMode state) {
    return {
      'CustomThemeMode': state.toString(),
    };
  }
}
