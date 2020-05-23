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
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff182952), Color(0xff2b3595)
          ]
        )
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                Container(
                  height: constraints.maxHeight * 0.4 - 40,
                  child: BarChartSample2(selectedRows: _selectedDataSetRows,)
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: ListView.builder(
                    itemCount: _selectedDataSetRows.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.white10))
                        ),
                        child: ListTile(
                          // leading: Text('${index + 1}', style: TextStyle(color: Colors.white54),),
                          title: Text(_selectedDataSetRows[index].name, style: TextStyle(color: Colors.white70, fontSize: 14)),
                          trailing:  Text('${index + 1}', style: TextStyle(color: Colors.white54),),
                        ),
                        
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}