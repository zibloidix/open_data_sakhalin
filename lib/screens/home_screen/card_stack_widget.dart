import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:open_data_sakhalin/models/data_set.dart';
import 'package:open_data_sakhalin/models/data_sets_catalog.dart';

class CardStackWidget extends StatelessWidget {

  List<DataSet> datasets = getDataSetsCatalog();
  LinearGradient backgroundGradient;

  CardStackWidget({Key key, this.backgroundGradient}): super(key: key);

  @override
  Widget build(BuildContext build) {
    return Container(
      height: 400,
      padding: EdgeInsets.only(top: 30),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0
                )
              ],
              gradient: backgroundGradient,
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/dataset', arguments: datasets[index]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    datasets[index].name,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox( height: 10),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.remove_red_eye, color: Colors.white54,),
                        SizedBox(width: 5,),
                        Text('${datasets[index].viewCount}', style: TextStyle( color: Colors.white),),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          );
        },
        itemCount: datasets.length,
        itemWidth: 300.0,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}