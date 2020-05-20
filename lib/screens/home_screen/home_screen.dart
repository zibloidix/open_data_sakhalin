import 'package:flutter/material.dart';
import 'package:open_data_sakhalin/screens/home_screen/add_data_set_widget.dart';
import 'package:open_data_sakhalin/screens/home_screen/card_stack_widget.dart';
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
  double _sizedBoxHeight = 28.0;
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
              child: Column(
                children: <Widget>[

                  SizedBox(height: _sizedBoxHeight,),

                  HomeScreenTopMenu(),

                  SizedBox( height: _sizedBoxHeight,),

                  HomeScreenJumbotron(
                    title: 'Каталог открытых финансовых данных Сахалинской области',
                    routerName: '/catalog',
                  ),

                  SizedBox( height: _sizedBoxHeight,),

                  HomeScreenTitle(title: 'Новости',),
                  HomeScreenSubtitle(
                    subtitle: 'За неделю', 
                    itemsCountTitle: '3+ Новости', 
                    bottomSheetContent: PeriodSelectorSheet(),
                  ),
                  NewsWidget(),

                  SizedBox(height: _sizedBoxHeight,),

                  HomeScreenTitle(title: 'Популярные',),
                  HomeScreenSubtitle(
                    subtitle: 'По просмотрам', 
                    itemsCountTitle: '10+ Наборов',
                    bottomSheetContent: CategorySelectorSheet(),
                  ),
                  CardStackWidget(),

                  SizedBox( height: _sizedBoxHeight,),
                  
                  HomeScreenTitle(title: 'Избранные',),
                  HomeScreenSubtitle(
                    subtitle: 'За месяц', 
                    itemsCountTitle: '10+ Наборов',
                    bottomSheetContent: PeriodSelectorSheet(),
                  ),
                  CardStackWidget(),

                  SizedBox(height: _sizedBoxHeight,),

                  AddDataSetWidget(),

                  SizedBox(height: _sizedBoxHeight,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
