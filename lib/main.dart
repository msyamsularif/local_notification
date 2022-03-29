import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.tealAccent,
        ),
      ),
      title: 'Green Thumbs',
      home: const HomePage(),
    );
  }
}
