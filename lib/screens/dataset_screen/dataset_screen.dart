import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/models/data_set.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:open_data_sakhalin/models/data_set_row.dart';
import 'package:open_data_sakhalin/models/mock_data_set_row.dart';
import 'package:open_data_sakhalin/models/mock_data_set_values.dart';
import 'dart:math';

List<String> dataSetsRowNames= getMockDataSetRowNames();
List<String> dataSetsCollNames = getMockDataSetCollNames();


class DatasetScreen extends StatefulWidget{
  @override
  DatasetScreenState createState() => DatasetScreenState();
}

class DatasetScreenState extends State<DatasetScreen>{

  DataSet dataSet;
  Random _random = Random();
  bool _showCheckbox = false;
  int _selectedRowsCount = 0;
  bool _isStarSelect = false;
  List<DataSetRow> _mockDataSetRows = getMockDataSetRow();
  
  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context).settings.arguments != null) {
      dataSet = DataSet.copyFrom(ModalRoute.of(context).settings.arguments);
    } else {
      dataSet = DataSet();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.deepPurple[800], Colors.pink[900]]
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.remove_red_eye, color: Colors.white54),
                              SizedBox(width: 5,),
                              Text('${dataSet.viewCount}', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 10,),
                              Icon(Icons.file_download, color: Colors.white54,),
                              SizedBox(width: 5,),
                              Text('${dataSet.downloadCount}', style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ),
                        SizedBox(width: 5,), 
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isStarSelect = !_isStarSelect;
                            });
                           // isStarSelect = !_isStarSelect ;
                          },
                          icon: Icon(_isStarSelect == false ? Icons.star_border : Icons.star, color: Colors.amberAccent,)
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            if (_selectedRowsCount > 0) {
                              List<DataSetRow> _selectedRows = _getSelectedRows();
                              Navigator.of(context).pushNamed('/charts', arguments: _selectedRows);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: _selectedRowsCount == 0 ? 4 : 10, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.donut_large, color: Colors.white54),
                                
                                Text(
                                  _selectedRowsCount == 0 ? '' : '  В выборке: $_selectedRowsCount', 
                                  style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ),
                        ),
                        
                      ],
                      
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${dataSet.name}',
                        style: TextStyle(fontSize: 34, color: Colors.indigo[50]),
                      ),
                    ),
                    Divider(color: Colors.black45,),
                    SizedBox(height: 10,),
                    Text('Дата актуальности: ${dataSet.relevanceDate}', style: TextStyle(color: Colors.white38),),
                    SizedBox(height: 5,),
                    Text('Дата публикации: ${dataSet.createdDate}', style: TextStyle(color: Colors.white38),),

                  ],
                ),
              ),
            ),
          ),
          _getDraggableScrollableSheet()
        ],
      ),
    );
  }

  DraggableScrollableSheet _getDraggableScrollableSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.85,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 4, right: 4.0),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  
                  children: <Widget>[
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _getCompareButton('Выбрать'),
                          SizedBox(width: 10,),
                          _getFilterButton('Раздел'),
                          SizedBox(width: 10,),
                          _getFilterButton('Подраздел'),
                          SizedBox(width: 10,),
                          _getFilterButton('Статья'),
                          SizedBox(width: 10,),
                          _getFilterButton('Вид расхода'),
                        ],
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight - 40,
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: _mockDataSetRows.length,
                          itemBuilder: (context, index) {
                            
                            return TreeNode(
                              leading: _showCheckbox == false? SizedBox() : Checkbox(
                                value: _mockDataSetRows[index].isSelected,
                                onChanged: (value){
                                  setState(() {
                                    if (value == true) {
                                      _selectedRowsCount += 1;
                                    } else {
                                       _selectedRowsCount -= 1;
                                    }
                                    _mockDataSetRows[index].isSelected = value;
                                  });
                                  
                                },
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Text(_mockDataSetRows[index].name),
                              ),
                              children: [
                                ..._mockDataSetRows[index].values.map((coll){
                                  return 
                                    TreeNode(
                                    leading: SizedBox(),
                                    title: Text(coll.title),
                                    children: <Widget>[
                                      TreeNode(
                                        leading: SizedBox(width: 20,),
                                        title: Text('${coll.value}', style: TextStyle(fontWeight: FontWeight.w700))
                                      ), 
                                    ],
                                  );
                                })
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _getCompareButton(name) {
    return InkWell(
      onTap: () {
        setState(() {
          _showCheckbox = !_showCheckbox;
        });
      },
      child: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.check_box, color: Colors.white, size: 20,),
      ),
    );
  }

  Widget _getFilterButton(name) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return SimpleDialog(
              contentPadding: EdgeInsets.only(bottom: 20),
              title: Text(''),
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Укажите значение',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text('Применить'),
                ),
              ],
            );
          }
        );
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Text('$name'),
            SizedBox(width: 5,),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  List<DataSetRow> _getSelectedRows() {
    return _mockDataSetRows.where( (row) => row.isSelected == true ).toList();
  }
}
