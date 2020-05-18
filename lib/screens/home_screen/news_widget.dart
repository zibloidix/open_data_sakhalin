import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/screens/home_screen/period_selector_sheet.dart';

List<String> news = [
  'Старт общественного голосования за общественные инициативы',
  'Конкурс проектов по представлению бюджетов и открытых данных',
  'О мерах поддержки субъектам малого и среднего предпринимательства',
];

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Container(
            height: 148,
            width: 240,
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.deepPurpleAccent[400],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      news[index],
                      style: TextStyle( 
                        fontSize: 16, 
                        fontWeight: FontWeight.w400, 
                        color: Colors.indigo[50]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}