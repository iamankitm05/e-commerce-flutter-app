import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeState());

  void toggleTheme() {
    emit(
      AppThemeState(
        isLightThemeActive: !state.isLightThemeActive,
      ),
    );
  }
}
