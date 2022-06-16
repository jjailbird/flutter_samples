import 'package:flutter/material.dart';
import 'package:base/src/ui/pages/responsive/responsive_layout.dart';
import 'package:base/src/ui/pages/responsive/mobile_body.dart';
import 'package:base/src/ui/pages/responsive/desktop_body.dart';

class HomeResponsive extends StatefulWidget {
  const HomeResponsive({Key? key}) : super(key: key);

  @override
  State<HomeResponsive> createState() => _HomeResponsiveState();
}

class _HomeResponsiveState extends State<HomeResponsive> {
  @override
  Widget build(BuildContext context) {
    
    // final currentWidth = MediaQuery.of(context).size.width;
    
    // return Scaffold(
    //   backgroundColor: currentWidth < 600 ? Colors.deepPurple[300] : Colors.green[300],
    //   body: Center(child: Text(currentWidth.toString())),
    // );
    return const Scaffold(
      body: Responsivelayout(mobileBody: MobileBody(), desktopBody: DesktopBody(),),
    );
  }
}