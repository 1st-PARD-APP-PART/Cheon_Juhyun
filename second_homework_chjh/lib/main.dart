import 'package:flutter/material.dart';
import 'package:flutter_application_1/textstyle.dart';

import 'secondpage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
// Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
      initialRoute: '/',
      routes: {
// When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
// When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
// Within the `FirstScreen` widget
          onPressed: () {
// Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            'Launch screen',
            style: title1Style(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
