import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:marahel/main.dart';
import 'package:marahel/modals/project.dart';
import 'package:marahel/store/secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:marahel/notifiers/User_notifier.dart';



// import 'modals/project.dart;
class AuthService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'logIn'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 201) {
        
        storage.saveData(
            'token', jsonDecode(response.body)['token'].toString());
            print(await storage.readData('user'));
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        }),
      );
      if (response.statusCode == 201) {
        storage.saveData(
            'token', jsonDecode(response.body)['token'].toString());

         storage.saveData(
        'userId', jsonDecode(response.body)['user']['id'].toString());
        // print(storage.readData('user'));
        return jsonDecode(response.body);
        
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

Future<void> logout() async{
  String? token = await storage.readData('token');
  var response = await http.get(Uri.parse(baseUrl + 'logOut'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    await storage.deleteData('token');

}

Future <String> getUserId() async {
  String? token = await storage.readData('token');
        var response = await http.get(
        Uri.parse(baseUrl + 'getUserId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
        },

      );
      if (response.statusCode == 201) {

        return jsonDecode(response.body).toString();
        
      } else {
        return jsonDecode(response.body).toString();
      }
}


}
