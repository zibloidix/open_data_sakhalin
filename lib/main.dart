import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/screens/catalogs_screen/catalog_screen.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen.dart';
import 'package:open_data_sakhalin/screens/dataset_screen.dart';
import 'package:open_data_sakhalin/screens/dataset_editor_screen.dart';
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
        '/search': (context) => SearchScreen(), 
        // '/dataset': (context) => DatasetScreen(),
        // '/dataset-editor': (context) => DatasetEditorScreen(),
      }
    );
  }
}