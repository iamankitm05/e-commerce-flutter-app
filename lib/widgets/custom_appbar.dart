import 'package:e_commerce_flutter_app/screens/shopping_cart_screen.dart';
import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool isCartScreen;
  const CustomAppBar({
    super.key,
    required this.text,
    this.isCartScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      actions: [
        GestureDetector(
          onTap: () {
            context.read<AppThemeCubit>().toggleTheme();
          },
          child: BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
              return Icon(
                state.isLightThemeActive ? Icons.dark_mode : Icons.light_mode,
              );
            },
          ),
        ),
        if (!isCartScreen) ...[
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () {
              ShoppingCartScreen.navigate(context: context);
            },
            child: const Icon(Icons.add_shopping_cart),
          )
        ],
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
