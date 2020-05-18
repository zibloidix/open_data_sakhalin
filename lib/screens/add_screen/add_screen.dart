import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget{
  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  color: Colors.deepPurpleAccent[700],
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(height: 80,),
                      // Container(
                      //   width: 250,
                      //   child: Center(child: Image.asset('assets/images/add.png')),
                      // ),
                      SizedBox(height: 120,),
                      Container(
                        width: 300,
                        height: 490,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 4.0,
                            color: Colors.black26
                          ),]
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            Text('Добавить набор данных', style: TextStyle(fontSize: 20)),
                            SizedBox(height: 5,),
                            Text('Укажите ссылки на структуру', style: TextStyle(fontSize: 13, color:Colors.black45)),
                            Text('и набор данных', style: TextStyle(fontSize: 13, color:Colors.black45)),
                            SizedBox(height: 30,),
                            Container(
                              width: 120,
                              height: 120,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/add.png',
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              width: 240,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.link),
                                  labelText: 'Ссылка на структуру',
                                )
                              ),
                            ),
                            Container(
                              width: 240,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.link),
                                  labelText: 'Ссылка на набор'
                                )
                              ),
                            ),
                            SizedBox(height: 40,),
                            RaisedButton(
                              color: Colors.indigoAccent[400],
                              child: Text('Загрузить', style: TextStyle(color: Colors.white),),
                              onPressed: (){},
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
      ),
    );
  }
}