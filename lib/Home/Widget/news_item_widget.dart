
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  NewsItemWidget({super.key,required this.imageURL,required this.newsCountry,required this.newsTitle,
  required this.newsSource,required this.newsTime});
  String imageURL;
  String newsCountry;
  String newsTitle;
  String newsSource;
  String newsTime;

 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 500,
      height: 500,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(imageURL)),
          //SizedBox(height:5),
          Text(newsCountry,style:TextStyle(fontSize: 20,color:Colors.white)),
          SizedBox(height:10),
          Text(newsTitle,style:TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold)),
          SizedBox(height:10),
          Row(children: [
            Text(newsSource,style:TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.bold)),
            SizedBox(width:20),
            Icon(Icons.timelapse_rounded,color:Colors.white),
            SizedBox(width:5),
            Text(newsTime,style:TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.bold)),
          ],),
          SizedBox(height:20),


        ],
      )
      


    );
  }
}