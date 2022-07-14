import 'package:flutter/material.dart';
import 'package:base/src/themes/themes.dart';
// import 'package:base/src/ui/pages/splash.dart';

import 'package:base/src/ui/pages/homeEmail.dart';
// Test widget =================================================
// import 'package:base/src/ui/email/email_card.dart';
// import 'package:base/src/ui/components/tags.dart';
// import 'package:base/src/ui/components/menu_side_item.dart';
// import 'package:base/src/ui/components/menu_side.dart';
// import 'package:base/src/ui/email/email_list.dart';

// import 'package:base/src/ui/pages/homeResponsive.dart';
// import 'package:base/src/ui/Navigation/AnimateWidgetAcrossScreens.dart';
// import 'package:base/src/ui/Navigation/NavigateNewScreen.dart';

// =============================================================
import 'package:base/src/ui/Navigation/NamedRoutes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Named Route",
        theme: getDefaultTheme(context),
        
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
          '/second': (context) => const SecondScreen(),
          ExtractArgumentsScreen.routeName: ((context) => const ExtractArgumentsScreen())
        },
        
        onGenerateRoute: (settings) {
          if (settings.name == PassArgumentScreen.routeName) {
            final args = settings.arguments as ScreenArguments;
            return MaterialPageRoute(
              builder: ((context) {
                return PassArgumentScreen(title: args.title,message: args.message);
              })
            );
          }
          // assert(false, 'Need to implement ${settings.name}');
          // return null;
        },
        // when using routes, do not use home property!
        // home: const SplashPage(home: EmailHome()), 

    );
  }
}
