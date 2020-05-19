import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:open_data_sakhalin/models/app_notification.dart';

var faker = Faker();


List<AppNotification> notifications = [
  AppNotification(
    icon: Icons.delete,
    name: 'Удаление набора',
    color: Colors.red,
  ),
  AppNotification(
    icon: Icons.update,
    name: 'Обновление набора',
    color: Colors.blue
  ),
  AppNotification(
    icon: Icons.playlist_add,
    name: 'Добавление набора',
    color: Colors.green,
  ),
];


class NotificationsScreen extends StatelessWidget {
  Random _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            var randomIndex = _random.nextInt(notifications.length - 1);
            AppNotification notification = notifications[randomIndex];
            DateTime date = faker.date.dateTime(minYear: 2020, maxYear: 2020);

            return Container(
              width: double.infinity,
              height: 100,
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(child: Icon(notification.icon), backgroundColor: notification.color, foregroundColor: Colors.white,),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(notification.name),
                      Text(DateFormat.yMd().format(date), style: TextStyle(fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                  subtitle: Text('Длииинннное название набора'),
                ),
              ),
            );
          } ,
        ),
      ),
    );
  }
}