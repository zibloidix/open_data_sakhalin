import 'package:flutter/material.dart';

class HomeScreenSubtitle extends StatelessWidget {
  String subtitle;
  String itemsCountTitle;
  dynamic bottomSheetContent;

  HomeScreenSubtitle({ Key key, this.subtitle, this.itemsCountTitle, this.bottomSheetContent }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () { 
              showBottomSheet(
                context: context, 
                backgroundColor: Colors.transparent,
                builder: (context) => bottomSheetContent, 
              );
              },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(subtitle, style: TextStyle(color: Colors.white),),
                  SizedBox( width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black54,),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(itemsCountTitle, style: TextStyle( color: Colors.white60),),
        ),
      ],
    );
  }
}