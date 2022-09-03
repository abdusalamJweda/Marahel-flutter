import 'package:flutter/material.dart';
import 'package:marahel/customWidgets/phase.dart';
import 'package:marahel/customWidgets/project.dart';
import 'package:marahel/customWidgets/task.dart';
import 'package:marahel/http_services/phases_service.dart';
import 'package:marahel/http_services/projects_service.dart';
import 'package:marahel/http_services/task_service.dart';

class ProjectView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectView();
  }
}

class _ProjectView extends State<ProjectView> {
  final ProjectsService projectsService = ProjectsService();
  final PhasesService phasesService = PhasesService();
  final TaskService taskService = TaskService();
  String view = 'projects';
  int id = -1;
  void changeView(String view,int id) {
    this.view = view;
    this.id = id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: (() {
      if (view == 'projects') {
        return FutureBuilder<List>(
            future: projectsService.getAllProjects(),
            builder: ((context, snapshot) {
              // print(snapshot);
              if (snapshot.hasData) {
                return ProjectWidget(changeView , snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
      } else if(view == 'phases'){
        
        // should return phase widget
        return FutureBuilder<List>(
            future: phasesService.getAllPhases(id),
            builder: ((context, snapshot) {
              // print(snapshot);
              if (snapshot.hasData) {
                return PhaseWidget(changeView, snapshot);
                
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));


      }else{
        // should return task widget
                return FutureBuilder<List>(
            future: taskService.getAllTasks(id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return TaskWidget(snapshot);
                
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
      }
    }())));
  }
}
