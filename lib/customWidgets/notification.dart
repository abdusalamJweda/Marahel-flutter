import 'package:flutter/material.dart';

import '../http_services/notification_service.dart';


class NotificationWidget extends StatefulWidget {
    var snapshot;
    final changeState;

  NotificationWidget(this.snapshot, this.changeState);

  // NotificationWidget(var snapshot) {
  //   this.snapshot = snapshot;
  // }
  @override
  State<StatefulWidget> createState() {
    return _NotificationWidget();
  }
}




class _NotificationWidget extends State<NotificationWidget> {

// final String userName, project;
    final NotificationService notiService = new NotificationService();

  @override
  Widget build(BuildContext context) {
    final length = widget.snapshot.data!.length as int;
    print(length);
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) {
      return Container(
        width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 248, 244, 245),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(Icons.add_card_rounded, size: 90),
              title: Text(widget.snapshot.data![i]['message'].toString()),
              // subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
            ),
            ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Accept', style: TextStyle(color: Color.fromARGB(255, 4, 0, 255))),
                    onPressed: () {
                      
                      
                      notiService.acceptInvite(widget.snapshot.data![i]['user_id'], widget.snapshot.data![i]['team_id'], widget.snapshot.data![i]['id'] as int);
                        notiService.refuseInvite(widget.snapshot.data![i]['id'] as int);
                        widget.changeState();
                      
                      print("accepted");
                    },
                  ),
                  FlatButton(
                    child: const Text('Reject', style: TextStyle(color: Color.fromARGB(255, 68, 0, 255))),
                    onPressed: () {
                      
                      
                      notiService.refuseInvite(widget.snapshot.data![i]['id'] as int);
                        widget.changeState();
                      
                      print("Rejected");
    
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        // height: 80,
        // color: Colors.amber[600],
        // child: const Center(child: Text('Entry A')),
      );
  });
  }
}