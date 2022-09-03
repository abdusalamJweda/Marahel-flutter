import 'package:flutter/material.dart';
import 'package:marahel/customWidgets/notification.dart';
import 'package:marahel/http_services/notification_service.dart';

class NotificationView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NotificationView();
  }
}


class _NotificationView extends State<NotificationView>  {

  void changeState(){
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    final NotificationService notiService = new NotificationService();
    return FutureBuilder<List>(
        future: notiService.getNotifications(),
        builder: ((context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            return NotificationWidget(snapshot, changeState);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));

    // ListView(
    //   padding: const EdgeInsets.all(8),
    //   children: <Widget>[

    //     ...(_notifications)
    //             .map((notification) {
    //           return NotificationWidget(notification['userName'] as String, notification['projectName'] as String);
    //         }).toList(),

    //     // List mapping should be done here
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),
    //     // NotificationWidget("Hi"),

    //   ],
    // );
  }
}
