import 'package:flutter/material.dart';
import 'dart:math';
import 'package:open_data_sakhalin/models/news.dart';

class NewsScreen extends StatefulWidget{
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen>{

  News news;
  
  @override
  Widget build(BuildContext context) {
    
    if(ModalRoute.of(context).settings.arguments != null) {
      news = News.copyFrom(ModalRoute.of(context).settings.arguments);
    } else {
      news = News();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(news.imagePath),
                  fit: BoxFit.cover
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
                              Text('${news.viewCount}', style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ),
                        SizedBox(width: 5,), 
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share, color: Colors.white,)
                        ),
                      ],
                      
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${news.title}',
                        style: TextStyle(
                          fontSize: 34, 
                          color: Colors.indigo[50], 
                          shadows: [Shadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 1.0),
                          )]
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('От: ${news.createdDate}', style: TextStyle(color: Colors.white38),),

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
                      height: 6,
                      child: Container(
                        width: 32,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: constraints.maxHeight - 40,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: news.content.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(news.content[index], style: TextStyle(fontSize: 18),),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
