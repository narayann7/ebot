import 'dart:convert';

import 'package:ebot/utility/common_function.dart';
import 'package:ebot/utility/constants.dart';
import 'package:ebot/view/conversation_history.dart';
import 'package:flutter/material.dart';

import 'package:ebot/controller/hive_db.dart';

class ConversationData {
  List<dynamic> formattedMessages;
  ConversationData({
    required this.formattedMessages,
  });

  Map<String, dynamic> toMap() {
    return {
      'formattedMessages': formattedMessages,
    };
  }

  factory ConversationData.fromMap(Map<String, dynamic> map) {
    return ConversationData(
      formattedMessages: List<dynamic>.from(map['formattedMessages']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationData.fromJson(String source) =>
      ConversationData.fromMap(json.decode(source));
}

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);
  static const String routeName = '/Conversation';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Conversation"),
        builder: (c) {
          return const Conversation();
        });
  }

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  List<String> names = [];
  var data;

  Future<bool> openBox() async {
    var temp = await AppHiveDb.getAllConversation();
    data = temp;
    for (var i = 0; i < temp.length; i++) {
      names.add(temp[i]["title"]);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          title: myText("Conversations History"),
          backgroundColor: bg,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: () async {
                    names.clear();
                    setState(() {});
                    await AppHiveDb.clearAllConversation();
                  },
                  child: const Icon(Icons.delete)),
            ),
          ],
        ),
        body: FutureBuilder(
          future: openBox(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 40, left: 40),
                    child: GestureDetector(
                      onTap: () {
                        teleportWithArguments(
                            context,
                            SingleConversions.routeName,
                            data[index]["message"]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: bg2,
                            borderRadius: BorderRadius.circular(12)),
                        child: myText(names[index]),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
