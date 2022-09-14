import 'package:flutter/material.dart';
import 'package:flutter_interacting_with_api/core/utils/shared_perf.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/crypto_bloc/home_bloc.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/bloc/theme_cubit.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/screens/crypto_screen.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/screens/temp.dart';
import 'package:flutter_interacting_with_api/locator.dart';
import 'features/feature_home/presentation/screens/main_wrapper.dart';
import 'features/feature_home/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();
  await setup();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => locator<HomeBloc>()),
    BlocProvider(create: (_) => locator<ThemeCubit>()),
  ], child: Application()));
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: BlocProvider.of<ThemeCubit>(context).state.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: Temp(),
        );
      },
    );
  }
}
