import 'package:flutter/material.dart';
import 'package:newsproj/model/source_response.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({super.key,required this.isSelected, required this.source});
  bool isSelected;
  Sources source;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:3,top:10),
      padding: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff1877f2),width: 2),
        color: isSelected?Color(0xff1877f2):Colors.transparent,
      ),
      child: Text(source.name??"",style: TextStyle(fontSize: 20,color: isSelected?Colors.black:Colors.white),),
    );
  }
}