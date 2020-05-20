import 'package:flutter/material.dart';

class AddDataSetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/add'),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Добавить набор', style: TextStyle(color: Colors.white, fontSize: 24)), 
                  SizedBox(height: 10,),
                  Icon(Icons.add, size: 38, color: Colors.white,),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[700],
                borderRadius: BorderRadius.circular(16)
              ),
            ),
          ),
        ),
      ),
    );
  }
}