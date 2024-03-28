import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      actions: [
        IconButton(
          onPressed: () {
            context.read<AppThemeCubit>().toggleTheme();
          },
          icon: BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
              return Icon(
                state.isLightThemeActive ? Icons.dark_mode : Icons.light_mode,
              );
            },
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
