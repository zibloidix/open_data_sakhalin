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
                    leading: Icon(Icons.search, color: Colors.white,),
                    title: Text('Поиск', style: _menuItemTextStyle,),
                    onTap: () => Navigator.of(context).pushNamed('/search'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.white,),
                    title: Text('Избранное', style: _menuItemTextStyle),
                    onTap: () => Navigator.of(context).pushNamed('/catalog'),
                  ),
                  
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.white,),
                    title: Text('Уведомления', style: _menuItemTextStyle,),
                    onTap: () => Navigator.of(context).pushNamed('/notifications'),
                  ),
                  ListTile(
                    leading: Icon(Icons.data_usage, color: Colors.white,),
                    title: Text('Каталог данных', style: _menuItemTextStyle),
                    onTap: () => Navigator.of(context).pushNamed('/catalog'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add, color: Colors.white,),
                    title: Text('Добавить свой набор', style: _menuItemTextStyle),
                    onTap: () => Navigator.of(context).pushNamed('/add'),
                  ),
                  SizedBox(height: 40,),

                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.white,),
                    title: Text('Выход', style: _menuItemTextStyle),
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