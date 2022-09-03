import 'package:flutter/material.dart';
import 'package:marahel/customWidgets/chat.dart';

class MessageWidget extends StatelessWidget {
  final changeView;
  var chat;

  MessageWidget(this.changeView, this.chat);

  @override
  Widget build(BuildContext context) {
    final length = chat.data!.length as int;
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) {
        return Container(
          width: 200,
          height: 150,
          child: GestureDetector(
            onTap: () {
              changeView('vhat', chat.data![i]['id']);
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
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile-icon.jpg'),
                              ),
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
                                  chat.data![i]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                chat.data![i]['email'],
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    GestureDetector(
      onTap: () {
        changeView('chat', 1);
      },
      child: Container(
        width: 200,
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 248, 244, 245),
          elevation: 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/login.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 10.0, 10.0, 10.0),
                child: Column(
                  children: [
                    Text(
                      "User Name",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "message",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
