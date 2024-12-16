
import 'package:flutter/material.dart';
import 'package:newsproj/Home/Widget/news_item_widget.dart';
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
  String selectedTab="";
  @override
  void initState()
  {
    super.initState();
    selectedTab=widget.sources[0].name!;
    
  }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: widget.sources.length, 
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex=index;
              selectedTab=widget.sources[selectedIndex].name!;
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
        
        var selectedList=[];
        
        for(int i=0;i<newsList.length;i++)
        {
          if(newsList[i].source?.name==selectedTab)
          {
            selectedList.add(newsList[i]);
            
          }
        }
        if(selectedList.length==0)
        {
          return Center(
            child: Text("No Available News for this category",
            style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white)),
          );

        }
        else{
        return Expanded(
          child: ListView.builder(
            itemCount: selectedList.length,
            /*itemBuilder:(context, index) {
              return Text(newsList[index].title??"",style: TextStyle(color:Colors.white,fontSize: 20),);
            },*/
            itemBuilder:(context, index) {
              String dateStringWithTimeZone =  selectedList[index].publishedAt;
              DateTime dateTimeWithTimeZone = DateTime.parse(dateStringWithTimeZone);
             
              int dayPublished=dateTimeWithTimeZone.day;
              int monthPublished=dateTimeWithTimeZone.month;
              int yearPyblished=dateTimeWithTimeZone.year;
              int hourPublished=dateTimeWithTimeZone.hour;
              int minutesPublished=dateTimeWithTimeZone.minute;
              int secondsPublished=dateTimeWithTimeZone.second;
              
              final DateTime now = DateTime.now();
              int dayNow=now.day;
              int monthNow=now.month;
              int yearNow=now.year;
              int hourNow=now.hour;
              int minutesNow=now.minute;
              int secondsNow=now.second;

              String newsTime="";
              if(dayPublished==dayNow&&monthPublished==monthNow&&yearPyblished==yearNow)
              {
                
                  newsTime="${hourPublished-hourNow} h ago";
              
                 
              }
              else{
                newsTime="$dayPublished-$monthPublished-$yearPyblished   $hourPublished:$minutesPublished:$secondsPublished";


              }
             // String Date=now.toString().split('T')[-1];
              //String Time=now.toString().split('T')[1].split('Z')[0];
              //print(Date);
              //print(Time);

              return NewsItemWidget(imageURL: selectedList[index].urlToImage??"",
              newsCountry: selectedList[index].source?.name??"",newsTitle: selectedList[index].title??"",
              newsSource: selectedList[index].source?.name??"",newsTime: newsTime/*selectedList[index].publishedAt??""*/,);
              
            },
            ),
        );     
        }
        },),
        ],
      ),
       
        
      );
  }
}
