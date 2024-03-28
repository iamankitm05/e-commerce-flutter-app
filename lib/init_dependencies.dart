import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initDependencies() async {
  _initTheme();
}

void _initTheme() {
  getIt.registerLazySingleton(() => AppThemeCubit());
}
