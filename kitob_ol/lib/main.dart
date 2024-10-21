import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitob_ol/controllers/auth_cubit.dart'; // Import your AuthCubit
import 'package:kitob_ol/service/auth_service.dart'; // Import your AuthService
import 'package:kitob_ol/views/screens/main/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthService()),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData.light().copyWith(
          textTheme: textTheme,
          primaryTextTheme: textTheme,
        ),
        dark: ThemeData.dark().copyWith(
          textTheme: textTheme,
          primaryTextTheme: textTheme,
        ),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
