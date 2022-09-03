// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:marahel/http_services/task_service.dart';
import 'package:marahel/views/projectsView.dart';

class TaskWidget extends StatefulWidget {
  final task;
  TaskWidget(this.task);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskWidget();
  }
}
// bool value = false;

class _TaskWidget extends State<TaskWidget> {
  // var task = widget.task;
  // final cahngeView;

  TaskService taskService = TaskService();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final length = widget.task.data!.length as int;

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) {
        // widget.task.data![i]['status'] == 1?status = true: status =false;
        return Container(
          width: 200,
          // height: 150,
          child: GestureDetector(
            onTap: () {
              // cahngeView('tasks', task.data![i]['id']);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  // width: 430,
                  // height: 100,
                  child: Wrap(
                    children: [
                      Checkbox(
                        
                            value: widget.task.data![i]['status'] == 1
                                ? true
                                : false,
                            onChanged: (bool? value) async {
                              // print(!widget.task.data![i]['status']);
                              await taskService.changeStatus(
                                  widget.task.data![i]['id'],
                                  value == true ? 1 : 0);
                              setState(() {
                                value == true
                                    ? widget.task.data![i]['status'] = 1
                                    : widget.task.data![i]['status'] = 0;
                              });
                            },
                          ),
                      Text(
                        widget.task.data![i]['name'],
                        style: TextStyle(
                            color: Colors.greenAccent[400],
                            fontSize: 30), //TextStyle
                      ),
                      Divider(
                      color: Colors.black,
                      thickness: .2,
                      indent: 8,
                      endIndent: 8,
                    ), //Text
                      SizedBox(height: 10),
                      Wrap(
                        children: <Widget>[
                          
                           //SizedBox
                          Text(
                            widget.task.data![i]['description'],
                            style: TextStyle(fontSize: 17.0),
                          ), //Text
                          // SizedBox(width: 10), //SizedBox
                          /** Checkbox Widget **/
                          //Checkbox
                        ], //<Widget>[]
                      ), //Row
                    ],
                  ), //Column
                ), //SizedBox
              ), //Padding
            ),
          ),
        );
      },
    );
  }
}
