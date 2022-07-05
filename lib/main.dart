import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news',
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (_) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(color: Colors.red)),
    );
  }
}
