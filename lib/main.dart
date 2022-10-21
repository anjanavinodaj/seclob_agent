import 'package:flutter/material.dart';
import 'package:seclob_agent/view/screens/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seclob Agent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash(),
    );
  }
}
