import 'package:flutter/material.dart';
import 'package:newsproj/Home/Widget/tab_item_widget.dart';
import 'package:newsproj/api/api.dart';
import 'package:newsproj/model/news_response.dart';
import 'package:newsproj/model/source_response.dart';

class TabContainerWidget extends StatefulWidget {
  TabContainerWidget({super.key,required this.sources});
  List<Sources>sources ;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length, 
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex=index;
              setState(() {
                
              });
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sources.map((source)=>
            TabItemWidget(
              isSelected: selectedIndex==widget.sources.indexOf(source)
            , source: source)).toList()),
             FutureBuilder<NewsResponse>(future: API.getNews(),
              builder: (context, snapshot) {
                if(snapshot.hasError)
        {
          return Text("Error",style: TextStyle(color: Colors.white,fontSize: 30),);
        }
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child:CircularProgressIndicator(color: Color(0xff1877f2),));
        }
        var newsList = snapshot.data?.articles??[];
        return Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder:(context, index) {
              return Text(newsList[index].title??"",style: TextStyle(color:Colors.white,fontSize: 20),);
            },),
        );     
        },),
        ],
      ),
       
        
      );
  }
}