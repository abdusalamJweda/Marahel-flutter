import 'package:flutter/material.dart';
import 'package:marahel/http_services/auth_service.dart';
import 'package:marahel/main.dart';
import 'package:marahel/store/secure_storage.dart';
import 'package:marahel/views/messageView.dart';
import 'package:marahel/views/notificationView.dart';
import 'package:marahel/views/projectsView.dart';

class HomePage extends StatelessWidget {
  SecureStorage storage = SecureStorage();
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Marahel'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                auth.logout().then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (route) => false));
                // handle the press
              },
            ),
          ],
        ),
        body: Column(children: [
          TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.message,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.blue,
              ),
            ),
          ]),
          Expanded(
            child: TabBarView(children: [
              // projecta view
              ProjectView(),
              // Messages view
              MessageView(),
              // notifications view
              NotificationView(),
            ]),
          )
        ]),
      ),
    );
  }
}
