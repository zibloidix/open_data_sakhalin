import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/screens/add_screen/add_screen.dart';
import 'package:open_data_sakhalin/screens/catalogs_screen/catalog_screen.dart';
import 'package:open_data_sakhalin/screens/dataset_screen/dataset_screen.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen.dart';
import 'package:open_data_sakhalin/screens/dataset_screen.dart';
import 'package:open_data_sakhalin/screens/dataset_editor_screen.dart';
import 'package:open_data_sakhalin/screens/notifications_screen/notifications_screen.dart';
import 'package:open_data_sakhalin/screens/search_screen/search_screen.dart';

void main() => runApp(OpenDataSakhalin());


class OpenDataSakhalin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OpenDataSakhalin',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/catalog': (context) => CatalogScreen(),
        // '/search': (context) => SearchScreen(), 
        '/notifications': (context) => NotificationsScreen(),
        '/dataset': (context) => DatasetScreen(),
        '/add': (context) => AddScreen(),
      }
    );
  }
}