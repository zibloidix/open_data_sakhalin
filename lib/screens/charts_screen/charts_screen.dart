import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/screens/charts_screen/bar_chart.dart';
import 'package:open_data_sakhalin/models/data_set_row.dart';
import 'bar_chart_2.dart';

class ChartsScreen extends StatefulWidget {
  @override
  ChartsScreenState createState() => ChartsScreenState();
}

class ChartsScreenState extends State<ChartsScreen> {
  List<DataSetRow> _selectedDataSetRows;
  @override
  Widget build(BuildContext build) {
    
    if (ModalRoute.of(context).settings.arguments != null) {
        _selectedDataSetRows = ModalRoute.of(context).settings.arguments;
    } else {
        _selectedDataSetRows = [];
    }
    
    return Scaffold(
      body: Column(
        children: <Widget>[
          BarChartSample2(selectedRows: _selectedDataSetRows,),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: _selectedDataSetRows.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(_selectedDataSetRows[index].name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}