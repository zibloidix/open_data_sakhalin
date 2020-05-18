import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:open_data_sakhalin/screens/home_screen/category_selector_sheet.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_drawer.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen_jumbotron.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen_subtitle.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen_title.dart';
import 'package:open_data_sakhalin/screens/home_screen/home_screen_top_menu.dart';
import 'package:open_data_sakhalin/screens/home_screen/news_widget.dart';
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
                    HomeScreenTopMenu(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     IconButton(
                    //       icon: Icon(Icons.menu, color: Colors.white, size: 30),
                    //       onPressed: () => Scaffold.of(context).openDrawer(),
                    //     ),
                    //     IconButton(
                    //       icon: Icon(Icons.search, color: Colors.white, size: 30),
                    //       onPressed: () => Navigator.of(context).pushNamed('/search'),
                    //     ),
                    //   ],
                    // ),
                    SizedBox( height: 20,),
                    HomeScreenJumbotron(
                      title: 'Каталог открытых финансовых данных Сахалинской области',
                      routerName: '/catalog',
                    ),
                    SizedBox( height: 20,),
                    HomeScreenTitle(title: 'Популярные',),
                    HomeScreenSubtitle(
                      subtitle: 'По просмотрам', 
                      itemsCountTitle: '10+ Наборов',
                      bottomSheetContent: CategorySelectorSheet(),
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
                    
                    HomeScreenTitle(title: 'Новости',),
                    
                    HomeScreenSubtitle(
                      subtitle: 'За неделю', 
                      itemsCountTitle: '3+ Новости', 
                      bottomSheetContent: PeriodSelectorSheet(),
                    ),

                    NewsWidget(),

                  
                  ],
                ),
              ),
            ),
          ),
          
        ),
      );
  }
}