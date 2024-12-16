import 'package:flutter/material.dart';
import 'package:newsproj/Home/home_screen.dart';
import 'package:newsproj/api/api.dart';
import 'package:newsproj/model/news_response.dart';
import 'package:newsproj/model/source_response.dart';

void main() async{
  NewsResponse response = await API.getNews();
  print(response.status);
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
