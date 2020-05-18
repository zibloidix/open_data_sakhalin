import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:open_data_sakhalin/models/data_set.dart';
import 'package:open_data_sakhalin/models/data_sets_catalog.dart';

List<DataSet> datasets = getDataSetsCatalog();

class CatalogScreen extends StatefulWidget {
  @override
  CatalogScreenState createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  double _searchBarMinHeight = 100.0;
  double _searchBarMaxHeight = 300.0;
  double _searchBarHeight = 100.0;
  bool _showFilters = false;
  String _selectedYear = '2017';
  bool _isSelectedFavorites = false;
  bool _isSelectedImported = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: <Widget>[
                            
            AnimatedContainer(
              onEnd: () {
                setState(() {
                  _showFilters = _searchBarHeight == _searchBarMaxHeight ? true : false;
                });
              },
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              height: _searchBarHeight,
              color: Colors.deepPurpleAccent[400],
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                
                children: <Widget>[
                  SizedBox(height: 40,),
                  Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        blurRadius: 1,
                        color: Colors.black26,
                        offset: Offset(0.0, 1.0)
                      )],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Container(
                          width: 210, 
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Поиск набора данных',
                            ),
                          )
                        ),
                        IconButton(
                          icon: Icon(_showFilters == true ? Icons.keyboard_arrow_down : Icons.tune),
                          onPressed: () {
                            setState(() {
                              _showFilters = false;
                              _searchBarHeight = _searchBarHeight == _searchBarMinHeight  ? _searchBarMaxHeight : _searchBarMinHeight;
                            });
                          },
                        ),
                      ], 
                    ),
                  ),
                  _getFilter(),

                ],
              ),
            ),
            
            AnimatedContainer(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              color: Colors.white,
              height: constraints.maxHeight - _searchBarHeight,
              child: ListView.builder(
                itemCount: datasets.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child:  Text(datasets[index].name[0].toUpperCase()),
                        backgroundColor: Colors.deepPurpleAccent[400],
                      ),
                      title: Text(
                        datasets[index].name,
                        style: TextStyle( fontSize: 14),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text(datasets[index].createdDate),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.star_border),
                        onPressed: (){},
                      ),
                      onTap: () => Navigator.of(context).pushNamed('/dataset'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/add'),
      ),
    );
  }

  Widget _getFilter() {
    if (_showFilters == true) {
      return Container(
        height: 200,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox( height: 20, ),
                Center( child: Text('Отобрать по году публикации', style: TextStyle(fontSize: 16)), ),
                SizedBox( height: 10,),
                Container(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      InkWell(
                        onTap: (){ 
                          setState(() {
                            _selectedYear = '2016';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2016', style: TextStyle( color: _selectedYear == '2016' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2016' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all( color: Colors.indigoAccent[700]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2017';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2017', style: TextStyle( color: _selectedYear == '2017' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2017' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.symmetric( 
                              vertical: BorderSide( color: Colors.indigoAccent[700]),
                            ),
                            
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2018';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2018', style: TextStyle( color: _selectedYear == '2018' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2018' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all(color: Colors.indigoAccent[700]),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2019';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2019', style: TextStyle( color: _selectedYear == '2019' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2019' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.symmetric( 
                              vertical: BorderSide( color: Colors.indigoAccent[700]),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2020';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2020', style: TextStyle( color: _selectedYear == '2020' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2020' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all( color: Colors.indigoAccent[700]),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6)
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('В избранном', style: TextStyle(fontSize: 16)),
                              ),
                              Switch(
                                value: _isSelectedFavorites,
                                onChanged: (value) {
                                  setState(() {
                                    _isSelectedFavorites = value;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text('В добавленном', style: TextStyle(fontSize: 16)),
                            ),
                            Switch(
                              value: _isSelectedImported ,
                              onChanged: (value) {
                                setState(() {
                                  _isSelectedImported  = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox();
  }
}