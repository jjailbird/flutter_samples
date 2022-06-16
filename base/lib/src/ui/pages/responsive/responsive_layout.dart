// Reference | https://www.youtube.com/watch?v=MrPJBAOzKTQ&t=129s
// https://worship.agency/mobile-screen-sizes-for-2022-based-on-data-from-2021

import 'package:flutter/material.dart';

class Responsivelayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  
  const Responsivelayout({Key? key, required this.desktopBody, required this.mobileBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}