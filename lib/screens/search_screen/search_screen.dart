import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String _searchInputValue = '';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget> [
            SizedBox(height: 40,),
            Container(
              height: 100,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Поиск',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () { 
                      _controller.clear();
                      setState(() {
                        _searchInputValue = _controller.text;
                      });
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _searchInputValue = _controller.text;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.all(10)
                  
                ),
              ),
            ),
            Center(
              child: Text('${_controller.text}'),
            )
          ],
        ),
      ),
    );
  }
}