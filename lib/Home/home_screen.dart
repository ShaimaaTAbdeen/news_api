import 'package:flutter/material.dart';
import 'package:newsproj/Home/Widget/tab_container_widget.dart';
import 'package:newsproj/api/api.dart';
import 'package:newsproj/model/source_response.dart';

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
      body: FutureBuilder(future: API.getSources(), 
      builder:(context, snapshot) {
        if(snapshot.hasError)
        {
          return Text("Error",style: TextStyle(color: Colors.white,fontSize: 30),);
        }
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child:CircularProgressIndicator(color: Color(0xff1877f2),));
        }
        var sourcesList = snapshot.data?.sources??[];
        /*return ListView.builder(
          itemBuilder:(context, index) {
            return Text(sourcesList[index].name??"",style: TextStyle(color:Colors.white,fontSize: 20),);
          }, 
          itemCount: sourcesList.length);*/
          return TabContainerWidget(sources: sourcesList,);
      },
      )
    );
  }
}

