import 'package:flutter/material.dart';

class CategorySelectorSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black12,
          )
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 35,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(4)
              ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Категории', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),),
                FlatButton(
                  child: Text('Отмена', style: TextStyle(color: Colors.black54)),
                  onPressed: (){ Navigator.of(context).pop(); },
                ),
              ],
            ),
            Container(
              child: ListTile(
                onTap: () {},
                title: Text('По просмотрам'),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {},
                title: Text('По скачиваниям'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
