import 'package:flutter/material.dart';

class PeriodSelectorSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 1.0),
                    color: Colors.black26,
                    blurRadius: 6.0,
                  ),
                ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Container(
              width: 32,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(4),
                
              ),
              
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Отобрать за...', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),),
              ],
            ),
            SizedBox(height: 24,),

            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.check_circle_outline, color: Colors.black26,),
                  SizedBox(width: 10),
                  Text('24 часа', style: TextStyle( fontSize: 16 ),),
                ],
              ),
            ),
            SizedBox( height: 10,),
            Divider(),
            SizedBox( height: 10,),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.pinkAccent[400],),
                  SizedBox(width: 10),
                  Text('Неделю', style: TextStyle( fontSize: 16 ),),
                ],
              ),
            ),
            SizedBox( height: 10,),
            Divider(),
            SizedBox( height: 10,),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.check_circle_outline, color: Colors.black26,),
                  SizedBox(width: 10),
                  Text('Месяц', style: TextStyle( fontSize: 16 ),),
                ],
              ),
            ),
            SizedBox( height: 10,),
            Divider(),
            SizedBox( height: 10,),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.check_circle_outline, color: Colors.black26,),
                  SizedBox(width: 10),
                  Text('Год', style: TextStyle( fontSize: 16 ),),
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
