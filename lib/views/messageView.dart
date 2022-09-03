import 'package:flutter/material.dart';
import 'package:marahel/customWidgets/chat.dart';
import 'package:marahel/customWidgets/message.dart';
import 'package:marahel/http_services/message_service.dart';
import 'package:marahel/notifiers/User_notifier.dart';
import 'package:provider/provider.dart';

import '../http_services/projects_service.dart';

class MessageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageView();
  }
}

class _MessageView extends State<MessageView> {
  String view = 'messeges';
  int id = -1;
  void changeView(String view, int id) {
    this.view = view;
    this.id = id;
    setState(() {});
  }

  final MessageService messagesService = MessageService();

  @override
  Widget build(BuildContext context) {
    context.read<UserNotifier>().setUserId();
    return Scaffold(
      body: Container(
        child: (() {
          
          if (view == "messeges") {
            return FutureBuilder<List>(
                future: messagesService.getChatList(),
                builder: ((context, snapshot) {
                  // print(snapshot);
                  if (snapshot.hasData) {
                    return MessageWidget(changeView, snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }));
          } else {
            return FutureBuilder<List>(
                future: messagesService.getChat(this.id),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ChatWidget(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }));
                
          }
        }()),
      ),
    );
  }
}
