import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:open_data_sakhalin/screens/home_screen/category_selector_sheet.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_drawer.dart';
import 'package:open_data_sakhalin/screens/home_screen/period_selector_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
        height: 400,
        color: Color(0xff202040),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: HomeDrawer(),
          body: Builder(
              builder: (context) => SingleChildScrollView(
              child: Container(
                // padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.white, size: 30),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white, size: 30),
                          onPressed: () => Navigator.of(context).pushNamed('/search'),
                        ),
                      ],
                    ),
                    SizedBox( height: 20,),
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      highlightColor: Colors.deepPurpleAccent[400],
                      onTap: (){
                        Navigator.of(context).pushNamed('/catalog');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        height: 230,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent[400],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Каталог открытых финансовых данных Сахалинской области',
                                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300, color: Colors.indigo[50]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox( height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Популярные', style: TextStyle(fontSize: 36, color: Colors.white)),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz, size: 30, color: Colors.white,),
                          onPressed: (){},
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () { 
                              showBottomSheet(
                                context: context, 
                                backgroundColor: Colors.transparent,
                                builder: (context) => CategorySelectorSheet(), 
                              );
                             },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' По просмотрам', style: TextStyle(color: Colors.white),),
                                  SizedBox( width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black54,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('10+ Наборов', style: TextStyle( color: Colors.white60),),
                        ),
                      ],
                    ),
                    Container(
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
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Прогноз поступлений доходов областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
                                  style: TextStyle(fontSize: 20, color: Colors.black87),
                                ),
                                SizedBox( height: 10),
                                Container(
                                  width: 110,
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent[400],
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.remove_red_eye, color: Colors.white54,),
                                      SizedBox(width: 5,),
                                      Text('1200', style: TextStyle( color: Colors.white),),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                        itemWidth: 300.0,
                        layout: SwiperLayout.STACK,
                      ),
                    ),
                    SizedBox( height: 20,),

                    SizedBox( height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Новости', style: TextStyle(fontSize: 36, color: Colors.white)),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz, size: 30, color: Colors.white,),
                          onPressed: (){},
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () { 
                              showBottomSheet(
                                context: context, 
                                backgroundColor: Colors.transparent,
                                builder: (context) => PeriodSelectorSheet(), 
                              );
                             },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' За неделю', style: TextStyle(color: Colors.white),),
                                  SizedBox( width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black54,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('5+ Новостей', style: TextStyle( color: Colors.white60),),
                        ),
                      ],
                    ),

                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          
                          Container(
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
                                      'О мерах поддержки субъектам малого и среднего предпринимательства',
                                      style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: Colors.indigo[50]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
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
                                      'Старт общественного голосования за общественные инициативы',
                                      style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: Colors.indigo[50]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
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
                                      'Конкурс проектов по представлению бюджетов и открытых данных',
                                      style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: Colors.indigo[50]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          
                          
                        ],
                      ),
                    ),

                  
                  ],
                ),
              ),
            ),
          ),
          
        ),
      );
  }
}