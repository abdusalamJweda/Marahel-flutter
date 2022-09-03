import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marahel/store/secure_storage.dart';
// import 'modals/project.dart;
class NotificationService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';
  
  Future<List> getNotifications() async {
    String? token = await storage.readData('token');
    print('hello from noti get noti');
    try {
      var response = await http.get(Uri.parse(baseUrl + 'notification/getNotifications'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    },
    );
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


 Future<List> acceptInvite(userId, teamId, notiId) async{
      String? token = await storage.readData('token');
    print('hello from noti get noti');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'teams/addMember'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    },
    body: jsonEncode(<String, String>{
          'user_id': userId.toString(),
          'team_id': teamId.toString(),
        })
    );
    print(response.body);
      if (response.statusCode == 200) {
        // await refuseInvite(notiId);
        return jsonDecode(response.body);     
      }else {
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
 }

  Future<int> refuseInvite(notiId) async {
      String? token = await storage.readData('token');
    print('hello from noti get noti');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'notification/delete'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    },
    body: jsonEncode(<String, String>{
          'notification_id': notiId.toString(),

        })
    );
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