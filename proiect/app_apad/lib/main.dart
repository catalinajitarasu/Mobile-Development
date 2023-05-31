import 'package:flutter/material.dart';
import 'package:app_apad/hello/welcome.dart';
import 'package:app_apad/pages/homepage.dart';
import 'package:app_apad/utils/get_color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: GetColor.primarySeedColor,
            onPrimary: GetColor.primarySeedColor,
            surfaceTint: GetColor.secondarySeedColor,
        ),
        iconTheme: IconThemeData(
          color: GetColor.primarySeedColor
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: GetColor.primarySeedColor,
          labelStyle: TextStyle(
            color: GetColor.secondarySeedColor,
            fontSize: 16
          ),
          hintStyle: TextStyle(
            color: GetColor.secondarySeedColor,
            fontSize: 16,

          )
        ),

        textTheme: TextTheme(
          bodyMedium: TextStyle( 
            color: GetColor.primarySeedColor 
          ),
          bodyLarge: TextStyle(
            color: GetColor.primarySeedColor 
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: GetColor.primarySeedColor,
            foregroundColor: GetColor.whiteTextColor
          ),
        ),

        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: GetColor.primarySeedColor,
          foregroundColor: GetColor.whiteTextColor,
          titleTextStyle: const TextStyle(
              fontSize: 22,
              letterSpacing: 5
          ),
        )
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/homepage' : (context) => const HomePage()
      },
    );
  }
}



