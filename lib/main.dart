import 'package:anima_graphql/pages/list_animes_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orangeAccent,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: Colors.white54,
        colorScheme: const ColorScheme.light(primary: Colors.orangeAccent),
      ),
      home: const ListAnimesPage(),
    );
  }
}
