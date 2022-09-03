import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marahel/modals/project.dart';
import 'package:marahel/store/secure_storage.dart';
// import 'modals/project.dart;
class ProjectsService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';
  
  Future<List> getAllProjects() async {
    String? token = await storage.readData('token');
    try {
      var response = await http.get(Uri.parse(baseUrl + 'flutterRecentProjects'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
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

} 