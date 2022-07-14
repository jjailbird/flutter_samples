import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisrst Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Launch Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: const Text('Extract Arguments Screen'),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/extractArguments',
                  arguments: ScreenArguments(
                    'Extract Arguments Screen', 
                    "This message is extracted in the build method"
                  )
                );
              },
            ),
            ElevatedButton(
              child: const Text('PassArgumentScreen'),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  PassArgumentScreen.routeName,
                  arguments: ScreenArguments(
                    'Pass Arguments Screen', 
                    "This message is extracted in the build method"
                  )
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Go Back'),
        onPressed: () {
          // Navigator.pushNamed(context, '/');
          Navigator.pop(context);
        },
      )),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(args.message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;
  
  ScreenArguments(this.title, this.message);
}

class PassArgumentScreen extends StatelessWidget {
  const PassArgumentScreen({Key? key, required this.title, required this.message}) : super(key: key);

  static const routeName = '/passArgumentScreen';
  final String title;
  final String message; 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}