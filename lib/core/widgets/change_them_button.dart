import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/theme_cubit.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final themProvider = BlocProvider.of<ThemeCubit>(context);

        return FlutterSwitch(
          width: 50.0,
          height: 33.0,
          toggleSize: 25.0,
          value: themProvider.isDarkMode,
          borderRadius: 30.0,
          padding: 2.0,
          activeToggleColor: Color(0xFF6E40C9),
          inactiveToggleColor: Color(0xFF2F363D),
          activeSwitchBorder: Border.all(
            color: Color(0xFF3C1E70),
            width: 1.0,
          ),
          inactiveSwitchBorder: Border.all(
            color: Color(0xFFD1D5DA),
            width: 1.0,
          ),
          activeColor: Color(0xFF271052),
          inactiveColor: Colors.white,
          activeIcon: Icon(
            Icons.nights_stay,
            color: Color(0xFFF8E3A1),
          ),
          inactiveIcon: Icon(
            Icons.wb_sunny,
            color: Color(0xFFFFDF5D),
          ),
          onToggle: (value) {
            print(value);
            print("_______________val_________________");

            final provider = BlocProvider.of<ThemeCubit>(context);
            provider.toggleTheme(value);
          },
        );
      },
    );
  }
}
