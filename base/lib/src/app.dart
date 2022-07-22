import 'package:flutter/material.dart';
import 'package:base/src/themes/themes.dart';
import 'package:base/src/ui/pages/splash.dart';
import 'package:base/src/ui/pages/homeEmail.dart';
import 'package:base/src/ui/Navigation/ReturnDataFromScreen.dart';
import 'package:base/src/ui/Navigation/SendDataToNewScreen.dart';
import 'package:base/src/ui/oauth/github_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Basic",
      theme: getDefaultTheme(context),
      home: const GithubPage(title: 'Github Client'),
      // home: const SplashPage(home: HomeEmail()),
      // home: TodoScreen(
      //   todos: List.generate(
      //     20,
      //     (index) => Todo('Todo $index', 'A description of todo.$index')
      //   )
      // )
    );
  }
}
