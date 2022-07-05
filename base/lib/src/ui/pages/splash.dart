// splash screen https://www.youtube.com/watch?v=XXISgdYHdYw&t=355s

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final Widget home;
  
  const SplashPage({Key? key, required this.home}) : super(key: key);

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
    await Future.delayed(const Duration(milliseconds: 1500), (){});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> widget.home ));
  }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}