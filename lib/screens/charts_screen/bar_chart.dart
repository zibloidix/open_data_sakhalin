import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/models/data_set_row.dart';

class BarChartSample2 extends StatefulWidget {
  List<DataSetRow> selectedRows; 
  BarChartSample2({Key key, this.selectedRows}): super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;

  


  @override
  void initState() {
    super.initState();
    List<BarChartGroupData> items = [];
    var index = 0;
    double maxSum01 = 0.0;
    double maxSum02 = 0.0;

    widget.selectedRows.forEach((row){
      String sum_01 = row.values[4].value.replaceAll(',', '.');
      String sum_02 = row.values[5].value.replaceAll(',', '.');
      maxSum01 += double.parse(sum_01);
      maxSum02 += double.parse(sum_02);
    });


    widget.selectedRows.forEach((row){
      String sum_01 = row.values[4].value.replaceAll(',', '.');
      String sum_02 = row.values[5].value.replaceAll(',', '.');
      print('${maxSum01 / (double.parse(sum_01) * 100 )}, ${maxSum02 / ( double.parse(sum_02) * 100 )}');
      items.add(makeGroupData(index, maxSum01 / (double.parse(sum_01) * 100 ),  maxSum02 / ( double.parse(sum_02) * 100 )));
      index += 1;
      print(items.length);
    });

    
    // final barGroup1 = makeGroupData(0, 10,  10);
    // final barGroup2 = makeGroupData(1, 16, 12);
    // final barGroup3 = makeGroupData(2, 18, 5);
    // final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    final _items = [
      ...items
    ];

    rawBarGroups = _items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 10,),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 100,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (_a, _b, _c, _d) => null,
                          ),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot.touchedBarGroupIndex;

                            setState(() {
                              if (response.touchInput is FlLongPressEnd ||
                                  response.touchInput is FlPanEnd) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  double sum = 0;
                                  for (BarChartRodData rod
                                      in showingBarGroups[touchedGroupIndex].barRods) {
                                    sum += rod.y;
                                  }
                                  final avg =
                                      sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                  showingBarGroups[touchedGroupIndex] =
                                      showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                      return rod.copyWith(y: avg);
                                    }).toList(),
                                  );
                                }
                              }
                            });
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {
                            return '${value.toInt() + 1}';
                            
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            
                            if (value == 0) {
                              return '0';
                            } else if (value == 25) {
                              return '25';
                            } else if (value == 50) {
                              return '50';
                            } else if (value == 75) {
                              return '75';
                            } else if (value == 100) {
                            return '100';
                            } else {
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.donut_large, color: Color(0xff53fdd7)),
                    SizedBox(width: 5),
                    Text('Сумма за 2020 год', style: TextStyle(color: Color(0xff53fdd7))),
                    SizedBox(width: 15),
                    Icon(Icons.donut_large, color: Color(0xffff5182)),
                    SizedBox(width: 5),
                    Text('Сумма за 2021 год', style: TextStyle(color: Color(0xffff5182))),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        y: y2,
        color: rightBarColor,
        width: width,
      ),
    ]);
  }

}