import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marahel/modals/project.dart';
import 'package:marahel/store/secure_storage.dart';
// import 'modals/project.dart;
class PhasesService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';
  
  Future<List> getAllPhases(int projectId) async {
    String? token = await storage.readData('token');
    print('hello from Phases');
    try {
      var response = await http.post(Uri.parse(baseUrl + 'phases/findPhasesByProjectId'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    },
    body: jsonEncode(<String, String>{
          'project_id': projectId.toString(),

        }),);
    // print(response);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);     
      }else {
        print(response.body);
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

} 