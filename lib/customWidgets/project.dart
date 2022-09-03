import 'package:flutter/material.dart';
import 'package:marahel/views/projectsView.dart';

class ProjectWidget extends StatelessWidget {
  var project;
  final cahngeView;

  ProjectWidget(this.cahngeView, this.project);

  @override
  Widget build(BuildContext context) {
    final length = project.data!.length as int;
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) {
        return Container(
          width: 200,
          height: 150,
          child: GestureDetector(
            onTap: () {
              cahngeView('phases', project.data![i]['id']);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // if you need this
                side: BorderSide(
                  color: Colors.grey.withOpacity(.2),
                  width: 1,
                ),
              ),
              child: Container(
                width: 400,
                height: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 60.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Icon(Icons.assignment, size: 50,),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                                child: Text(
                                  project.data![i]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                project.data![i]['due_date'],
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: .2,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Discription: ' + project.data![i]['description'],
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            // Card(
            //   clipBehavior: Clip.antiAlias,
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(Icons.assignment_turned_in_outlined),
            //         title: Text(project.data![i]['name']),
            //         subtitle: Text(
            //           project.data![i]['due_date'],
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text(
            //           project.data![i]['description'],
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
