import 'package:flutter/material.dart';

class HomeScreenJumbotron extends StatelessWidget {
  String title;
  String routerName;

  HomeScreenJumbotron({Key key, this.title, this.routerName}): super(key: key);

  @override 
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      highlightColor: Colors.deepPurpleAccent[400],
      onTap: (){
        Navigator.of(context).pushNamed(routerName);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        height: 230,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent[400],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300, color: Colors.indigo[50]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}