import 'package:flutter/material.dart';
import 'package:worldclock/src/themes/themes.dart';
import 'package:worldclock/src/ui/pages/splash.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Base",
      theme: getDefaultTheme(context),
      home: const SplashPage(),
    );    
  }
}
