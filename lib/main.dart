import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medicare/constants/app_themes.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/data/providers/prefs_provider.dart';
import 'package:medicare/screens/splash_intro/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   prefs =await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [
        sharedPreferenceProvider.overrideWithValue(prefs),
      ],
      child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medcare',
      theme: AppThemes.lightTheme,
      themeMode: theme,
      home: SplashPage(),
      navigatorKey: navigatorKey,
    );
  }
}
