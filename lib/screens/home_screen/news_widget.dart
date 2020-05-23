import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/models/news.dart';
import 'package:open_data_sakhalin/screens/home_screen/period_selector_sheet.dart';
import 'package:open_data_sakhalin/models/mock_news.dart';

List<News> news = getMockNews();

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed('/news', arguments: news[index]),
            child: Container(
              height: 300,
              width: 240,
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[400],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(news[index].imagePath),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54]
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          news[index].title,
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
              ),
            ),
          );
        },
      ),
    );
  }
}