import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marahel/store/secure_storage.dart';

// import 'modals/project.dart;
class TaskService {
  SecureStorage storage = SecureStorage();
  String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List> getAllTasks(int phaseId) async {
    String? token = await storage.readData('token');
    print('hello from Tasks');
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'tasks/findPTasksByPhaseId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'phase_id': phaseId.toString(),
        }),
      );
      // print(response);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print(response.body);
        return Future.error('server Erorre');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> changeStatus(int id, int status) async {
    String? token = await storage.readData('token');
    print('hello from Tasks cahnge status');
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'tasks/changeStatus'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'task_id': id.toString(),
          'status': status.toString(),
        }),
      );
      // print(response);

    } catch (e) {
      return Future.error(e);
    }
  }
}
