import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/models/data_set.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:open_data_sakhalin/models/mock_data_set_values.dart';
import 'dart:math';

List<String> dataSetsRowNames= getMockDataSetRowNames();
List<String> dataSetsCollNames = getMockDataSetCollNames();

class DatasetScreen extends StatelessWidget {

  DataSet dataSet;
  Random _random = Random();

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
                              Text('${dataSet.viewCount}', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 10,),
                              Icon(Icons.file_download, color: Colors.white54,),
                              SizedBox(width: 5,),
                              Text('${dataSet.downloadCount}', style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ),
                        
                        IconButton(
                          icon: Icon(Icons.insert_chart, color: Colors.white, size: 30,),
                          onPressed: (){},
                        ),
                      ],
                      
                    ),
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
                  itemCount: dataSetsRowNames.length,
                  itemBuilder: (context, index) {
                    return TreeNode(
                      leading: SizedBox(),
                      // trailing: SizedBox(),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(dataSetsRowNames[index]),
                      ),
                      children: [
                        ...dataSetsCollNames.map((coll){
                          return 
                            TreeNode(
                            leading: Icon(Icons.arrow_drop_down),
                            title: Text(coll),
                            children: <Widget>[
                              TreeNode(
                                leading: SizedBox(width: 20,),
                                title: Text('${_random.nextInt(99999)}', style: TextStyle(fontWeight: FontWeight.w700))
                              ), 
                            ],
                          );
                        })
                        
                      ],
                    );
                    // return ListTile(
                    //   leading: Icon(
                    //     Icons.folder_open,
                    //     color: Colors.yellow,
                    //   ),
                    //   title: Text('Dataset $index'),
                    // );
                  }),
            ),
          );
        });
  }
}
