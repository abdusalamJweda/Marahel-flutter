import 'package:flutter/material.dart';
import 'package:marahel/homePage.dart';
import 'package:marahel/http_services/auth_service.dart';
import 'package:marahel/notifiers/User_notifier.dart';
import 'package:marahel/store/secure_storage.dart';
import 'package:marahel/views/loginRegisterView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => UserNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  Widget currentPage = LoginRegister();
  SecureStorage storage = SecureStorage();

  // This widget is the root of your application.
  void checkLogin() async {
    String? token = await storage.readData('token');

    print(token);

    if (token != null) {
      setState(() {
        currentPage = HomePage();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(getUserName());
    return MaterialApp(home: currentPage);
  }
}
