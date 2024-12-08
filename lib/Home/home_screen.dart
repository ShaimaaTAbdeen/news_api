import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        leading: Icon(Icons.menu,size: 35,color: Colors.white,),
        title:Center(
          child: Text('Sports',
          style: TextStyle(
            fontSize :30,
            fontWeight:FontWeight.bold,
            color: Colors.white,
            
            
          )),
        ),
        actions: [
          Icon(Icons.search,size: 35,color: Colors.white,),
        ],
      ),
    );
  }
}