import 'package:flutter/material.dart';

import 'package:marahel/http_services/auth_service.dart';
import 'package:marahel/http_services/message_service.dart';
import 'package:marahel/notifiers/User_notifier.dart';
import 'package:marahel/store/secure_storage.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatefulWidget {
  var chat;

  ChatWidget(var chat) {
    this.chat = chat;
  }
  @override
  State<StatefulWidget> createState() {
    return _ChatWidget();
  }
}

class _ChatWidget extends State<ChatWidget> {
  SecureStorage storage = SecureStorage();
  TextEditingController _messageController = TextEditingController();
  _ChatWidget();

  // PusherClient? pusher;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.chat.data!.length as int;
    final receiverId = widget.chat.data![0]!['receiver_id'] as int;
    List<dynamic> newChat = [
      {
        'id': 0,
        'message': String,
        'created_at': "2022-08-27T11:44:11.000000Z",
        'updated_at': String,
        'receiver_id': 0,
        'user_id': 0,
        'receiver': {
          'id': 0,
          'name': String,
          'email': String,
          'email_verified_at': String,
          'created_at': String,
          'updated_at': String,
          'deleted_at': String
        }
      }
    ];
    newChat = widget.chat.data!;
    MessageService messagesService = new MessageService();
    AuthService auth = new AuthService();
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            // height: 535,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: length,
                    itemBuilder: (context, i) {
                      // print(context.read<UserNotifier>().userId);
                      // print(newChat[i]);
                      // print(newChat);

                      // print(chat.data![i]!['user_id']);
                      return Container(
                        constraints: const BoxConstraints(
                          // maxHeight: 100,
                          minHeight: 50,
                        ),
                        width: 100,
                        // height: 50,
                        child: GestureDetector(
                            onTap: () {
                              // changeView('chat', chat.data![i]['id']);
                            },
                            child: Column(
                              crossAxisAlignment:
                                  newChat[i]!['user_id'].toString() ==
                                          context.read<UserNotifier>().userId
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // height: 50,
                                  constraints: const BoxConstraints(
                                      maxWidth: 400,
                                      minWidth: 150,
                                      // maxHeight: 100,
                                      minHeight: 50),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "" +
                                                newChat[i]['message']
                                                    .toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            newChat[i]["created_at"]
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        TextField(
          controller: _messageController,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            hintText: 'Enter a message',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
                onPressed: () {
                  newChat.add({
                    'id': 0,
                    'message': _messageController.text,
                    'created_at': "2022-08-27T11:44:11.000000Z",
                    'updated_at': String,
                    'receiver_id': 0,
                    'user_id': context.read<UserNotifier>().userId,
                    'receiver': {
                      'id': 0,
                      'name': String,
                      'email': String,
                      'email_verified_at': String,
                      'created_at': String,
                      'updated_at': String,
                      'deleted_at': String
                    }
                  });
                  messagesService.sendMessage(_messageController.text, receiverId);
                  _messageController.text = '';
                  setState(() {
                    newChat;
                  });
                  // chat.data[length +1]['message'] = "black";
                  // print(widget.chat.data.runtimeType);
                  // setState(() {
                  //   widget.chat.data;
                  // });
                }),
          ),
        ),
      ],
    );
  }
}
