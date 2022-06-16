// https://www.youtube.com/watch?v=XXISgdYHdYw&t=355s
import 'package:flutter/material.dart';
import 'package:base/src/ui/pages/home.dart';
import 'package:base/src/ui/pages/homeResponsive.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    _gotoHome();
  }

  _gotoHome() async {
    await Future.delayed(const Duration(milliseconds: 5500), (){});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeResponsive()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text(
            'Splash Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ), 
        ),
      ),
    );
  }
}