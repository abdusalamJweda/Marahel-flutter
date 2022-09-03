import 'dart:convert';

import 'package:http/http.dart';
import 'package:marahel/modals/project.dart';
// import 'modals/project.dart;
class HttpService {

  final postsUrl = Uri.parse('http://10.0.2.2:8000/api/projects');
  
  Future<List<Project>> getPosts() async {
    
    Response res = await get(postsUrl);

    if (res.statusCode == 200 ) {
      List<dynamic> body =  jsonDecode(res.body);

      List<Project> projects = body.map((dynamic item) => Project.fromJson(item)).toList();
    return projects;
    }else{
      throw "can not get projects";
    }
  }
} 