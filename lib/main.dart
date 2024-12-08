import 'package:flutter/material.dart';
import 'package:newsproj/Home/home_screen.dart';

void main() {
  runApp( NewsApp());
}

class NewsApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
      
    );
  }
}
