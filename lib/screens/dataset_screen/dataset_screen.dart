import 'package:flutter/material.dart';

class DatasetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
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
                              Text('12300', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 10,),
                              Icon(Icons.file_download, color: Colors.white54,),
                              SizedBox(width: 5,),
                              Text('2345', style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ),
                        
                        IconButton(
                          icon: Icon(Icons.more_horiz, color: Colors.white, size: 30,),
                          onPressed: (){},
                        ),
                      ],
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Источники финансирования дефицита областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
                        style: TextStyle(fontSize: 34, color: Colors.indigo[50]),
                      ),
                    ),
                    Divider(color: Colors.black45,),
                    SizedBox(height: 10,),
                    Text('Дата актуальности: 26.09.2017', style: TextStyle(color: Colors.white38),),
                    SizedBox(height: 5,),
                    Text('Дата публикации: 31.08.2017', style: TextStyle(color: Colors.white38),),

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
        maxChildSize: 0.88,
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
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.folder_open,
                        color: Colors.yellow,
                      ),
                      title: Text('Dataset $index'),
                    );
                  }),
            ),
          );
        });
  }
}
