import 'package:flutter/material.dart';

class HomeScreenTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        IconButton(
          icon: Icon(Icons.notifications_none , color: Colors.white, size: 30),
          onPressed: () => Navigator.of(context).pushNamed('/notifications'),
        ),
      ],
    );
  }
}