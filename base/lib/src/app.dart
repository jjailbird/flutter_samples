import 'package:flutter/material.dart';
import 'package:base/src/themes/themes.dart';
// import 'package:base/src/ui/pages/splash.dart';

// Test widget =================================================
import 'package:base/src/ui/email/email_card.dart';
import 'package:base/src/ui/components/tags.dart';
import 'package:base/src/ui/components/menu_side_item.dart';

// import 'package:base/src/ui/pages/homeResponsive.dart';
// =============================================================

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Base",
        theme: getDefaultTheme(context),
        // home: const SplashPage(home: EmailCard(isActive: false,),),
        // home: const Tags(),
        home: MenuSideItem(
          itemCount: 3,
          iconSrc: "assets/images/icons/Send.svg",
          title: "Sent",
          press: () {},
        ));
  }
}
