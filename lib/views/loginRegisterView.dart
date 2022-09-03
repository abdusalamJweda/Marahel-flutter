import 'package:flutter/material.dart';
import 'package:marahel/customWidgets/login.dart';
import 'package:marahel/customWidgets/register.dart';

class LoginRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) =>  Login(),
          'register': (context) => Register(),
        });
    
    
  }
}