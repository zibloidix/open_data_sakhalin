import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<String> datasets = [
  'Версия методических рекомендаций',
  'форма_0503317M_таблица_Доходы бюджета',
  'форма_0503317M_таблица_Расходы',
  'форма_0503317M_таблица_Источники финансирования',
  'форма_0503317M_таблица_Таблица консолидируемых расчетов',
  'Реализация Указов Президента РФ (по мероприятиям и источникам)',
  'Прогноз поступления доходов на период 2018-2020 годы',
  'Функциональная структура расходов областного бюджета на период 2018-2020 годы',
  'Общий объем и распределение бюджетных ассигнований, направляемых на государственную поддержку семьи и детей, на 2018 год',
  'Прогноз поступлений доходов на 2019-2021 годы',
  'Общий объем и распределение бюджетных ассигнований, направляемых на государственную поддержку семьи и детей, на плановый период 2020 и 2021 годов',
  'Функциональная структура расходов областного бюджета на 2019 год',
  'Сведения об использовании средств областного и федерального бюджетов, юридических и физических лиц на реализацию мероприятий государственной программы',
  'Сведения о степени реализации мероприятий государственной программы',
  'Ведомственная структура расходов областного бюджета на плановый период 2020 и 2021 годов',
  'Программная структура расходов областного бюджета на 2019 год',
  'Ведомственная структура расходов областного бюджета на 2019 год',
  'Прогноз поступлений доходов областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
  'Программную структуру расходов областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
  'Общий объем и распределение бюджетных ассигнований, направляемых на государственную поддержку семьи и детей, на 2020 год и на плановый период 2021 и 2022 годов',
  'форма_0503317M_таблица_Доходы бюджета (Анивский ГО)',
  'форма_0503317M_таблица_Источники финансирования (Анивский ГО)',
  'форма_0503317M_таблица_Расходы (Анивский ГО)',
  'форма_0503317M_таблица_Таблица консолидируемых расчетов (Анивский ГО)',
  'форма_0503317M_таблица_Доходы бюджета (Южно-Сахалинск)',
  'форма_0503317M_таблица_Расходы (Южно-Сахалинск)',
  'форма_0503317M_таблица_Источники финансирования (Южно-Сахалинск)',
  'форма_0503317M_таблица_Таблица консолидируемых расчетов (Южно-Сахалинск)',
  'Сводный отчет размещения заказов',
  'Функциональная структура расходов областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
  'Распределение бюджетных ассигнований на плановый период 2019 и 2020 годов',
  'Программная структура расходов областного бюджета на 2018 год',
  'Распределение бюджетных ассигнований на плановый период по целевым статьям 2019 и 2020 годов',
  'Ведомственная структура расходов областного бюджета на 2018 год',
  'Ведомственная структура расходов областного бюджета на плановый период 2019 и 2020 годов',
  'Общий объем и распределение бюджетных ассигнований, направляемых на государственную поддержку семьи и детей, на плановый период 2019 и 2020 годов',
  'Источники финансирования дефицита на  2020- 2021 годы',
  'Программная структура расходов областного бюджета на 2020 - 2021 годы',
  'Функциональная структура расходов областного бюджета на период 2020-2021 годы',
  'Общий объем и распределение бюджетных ассигнований, направляемых на государственную поддержку семьи и детей, на 2019  год',
  'Источники финансирования дефицита на  2019 год',
  'Источники финансирования дефицита областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
  'Ведомственную структуру расходов областного бюджета на 2020 год и на плановый период 2021 и 2022 годов',
];

class CatalogScreen extends StatefulWidget {
  @override
  CatalogScreenState createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  double _searchBarMinHeight = 100.0;
  double _searchBarMaxHeight = 300.0;
  double _searchBarHeight = 100.0;
  bool _showFilters = false;
  String _selectedYear = '2017';
  bool _isSelectedFavorites = false;
  bool _isSelectedImported = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: <Widget>[
                            
            AnimatedContainer(
              onEnd: () {
                setState(() {
                  _showFilters = _searchBarHeight == _searchBarMaxHeight ? true : false;
                });
              },
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              height: _searchBarHeight,
              color: Colors.deepPurpleAccent[400],
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                
                children: <Widget>[
                  SizedBox(height: 40,),
                  Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        blurRadius: 1,
                        color: Colors.black26,
                        offset: Offset(0.0, 1.0)
                      )],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Container(
                          width: 210, 
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Поиск набора данных',
                            ),
                          )
                        ),
                        IconButton(
                          icon: Icon(_showFilters == true ? Icons.keyboard_arrow_down : Icons.tune),
                          onPressed: () {
                            setState(() {
                              _showFilters = false;
                              _searchBarHeight = _searchBarHeight == _searchBarMinHeight  ? _searchBarMaxHeight : _searchBarMinHeight;
                            });
                          },
                        ),
                      ], 
                    ),
                  ),
                  _getFilter(),

                ],
              ),
            ),
            
            AnimatedContainer(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              color: Colors.white,
              height: constraints.maxHeight - _searchBarHeight,
              child: ListView.builder(
                itemCount: datasets.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child:  Text(datasets[index][0].toUpperCase()),
                        backgroundColor: Colors.deepPurpleAccent[400],
                      ),
                      title: Text(
                        datasets[index],
                        style: TextStyle( fontSize: 14),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text('01.12.2020'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.star_border),
                        onPressed: (){},
                      ),
                      onTap: () => Navigator.of(context).pushNamed('/dataset'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/add'),
      ),
    );
  }

  Widget _getFilter() {
    if (_showFilters == true) {
      return Container(
        height: 200,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox( height: 20, ),
                Center( child: Text('Отобрать по году публикации', style: TextStyle(fontSize: 16)), ),
                SizedBox( height: 10,),
                Container(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      InkWell(
                        onTap: (){ 
                          setState(() {
                            _selectedYear = '2016';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2016', style: TextStyle( color: _selectedYear == '2016' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2016' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all( color: Colors.indigoAccent[700]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2017';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2017', style: TextStyle( color: _selectedYear == '2017' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2017' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.symmetric( 
                              vertical: BorderSide( color: Colors.indigoAccent[700]),
                            ),
                            
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2018';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2018', style: TextStyle( color: _selectedYear == '2018' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2018' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all(color: Colors.indigoAccent[700]),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2019';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2019', style: TextStyle( color: _selectedYear == '2019' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2019' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.symmetric( 
                              vertical: BorderSide( color: Colors.indigoAccent[700]),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _selectedYear = '2020';
                          });
                        },
                        child: Container(
                          child: Center(child: Text('2020', style: TextStyle( color: _selectedYear == '2020' ? Colors.white : Colors.indigoAccent[700]),)),
                          width: 60,
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            color: _selectedYear == '2020' ? Colors.indigoAccent[700] : Colors.white,
                            border: Border.all( color: Colors.indigoAccent[700]),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6)
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('В избранном', style: TextStyle(fontSize: 16)),
                              ),
                              Switch(
                                value: _isSelectedFavorites,
                                onChanged: (value) {
                                  setState(() {
                                    _isSelectedFavorites = value;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text('В добавленном', style: TextStyle(fontSize: 16)),
                            ),
                            Switch(
                              value: _isSelectedImported ,
                              onChanged: (value) {
                                setState(() {
                                  _isSelectedImported  = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox();
  }
}