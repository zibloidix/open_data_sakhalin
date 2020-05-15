import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  TextStyle _menuItemTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff202034),
        child: ListView(
          children: <Widget>[
            Container(
              child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent,
                          child: Icon(Icons.account_circle, size: 52,),
                          radius: 10,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text('Aleksey Lomov', style: TextStyle( color: Colors.white )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Поиск', style: _menuItemTextStyle,),
                    onTap: () => Navigator.of(context).pushNamed('/search'),
                  ),
                  ListTile(
                    title: Text('Каталог данных', style: _menuItemTextStyle),
                    onTap: () => Navigator.of(context).pushNamed('/catalog'),
                  ),
                  ListTile(
                    title: Text('Добавить свой каталог', style: _menuItemTextStyle),
                    onTap: () {},
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}