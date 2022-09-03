import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marahel/store/secure_storage.dart';
// import 'modals/project.dart;
class MessageService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';
  
  Future<List> getChatList() async {
    String? token = await storage.readData('token');
    print('hello from geChatList');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'chat/getChatList'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    },
    body: jsonEncode(<String, String>{
          'project_id': '',
        }),);
    // print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);     
      }else {
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
  Future<List> getChat(userId) async {
    String? token = await storage.readData('token');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'chat/getChat'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
          'receiver_id': userId.toString(),
        }),);
    // print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);     
      }else {
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
  Future<void> sendMessage(String message, int receiverId) async{
    String? token = await storage.readData('token');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'chat/send-message'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
          "message": message,
          "receiver_id": receiverId.toString(), 
        }),);
    print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);     
      }else {
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
} 