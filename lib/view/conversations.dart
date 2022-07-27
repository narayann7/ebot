import 'dart:developer';

import 'package:ebot/controller/hive_db.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

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
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () async {
                  // log(names.toString());
                },
              ),
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
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        log(data[0]["message"].toString());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18.0),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(color: Colors.amber[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(names[index]),
                            // GestureDetector(
                            //     onTap: () {
                            //       setState(() async {
                            //         names.removeAt(index);
                            //         await AppHiveDb.clearSingleConversation(
                            //             index);
                            //       });
                            //     },
                            //     child: const Icon(Icons.delete))
                          ],
                        ),
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
