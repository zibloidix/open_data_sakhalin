import 'package:flutter/material.dart';

class HomeScreenTitle extends StatelessWidget {
  String title;

  HomeScreenTitle({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(title, style: TextStyle(fontSize: 36, color: Colors.white)),
        ),
      ],
    );
  }
}