import 'package:flutter/material.dart';
import 'contentpage.dart';
import 'dart:async';

import 'package:oops_1/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'pomodoro_clock.dart'; // Import the Pomodoro clock file

Future<void> main() async {
  runApp(const ZenbudHomePage());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  await Alarm.init(showDebugLogs: true);
}

class ZenbudHomePage extends StatelessWidget {
  const ZenbudHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenBud App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Navigate to ContentPage after a certain duration
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContentPage()),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 16), // Adjust the left padding
          alignment: Alignment.centerLeft, // Align the title to the left
          child: const Text(
            "",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20), // Add some space
            Image.asset(
              'assets/zendark.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 10), // Add some space between image and text
            const Text(
              '',
              style: TextStyle(
                color: Colors.blue, // Set the text color to blue
                fontSize: 30, // Set the font size
                fontWeight: FontWeight.bold, // Set the font weight
                fontFamily: 'Roboto', // Use a rounded font family
              ),
            ),
          ],
        ),
      ),
    );
  }
}
