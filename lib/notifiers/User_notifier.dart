import 'package:flutter/material.dart';
import 'package:marahel/http_services/auth_service.dart';

class UserNotifier extends ChangeNotifier{
  AuthService auth = new AuthService();
  String? _userId = "";
  String? get userId => _userId;

  void setUserId() async{
    _userId = (await auth.getUserId());
    notifyListeners();
  }
}