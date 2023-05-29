import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'StartPage.dart';
// import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // on below line we are specifying title of our app
      title: 'APP Demo',
      // on below line we are hiding debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // on below line we are specifying theme
        // primarySwatch: Colors.grey,
        primarySwatch: createMaterialColor(Colors.black),
      ),
      // First screen of our app
      home: const StartPage(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
