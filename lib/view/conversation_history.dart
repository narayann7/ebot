import 'package:ebot/utility/common_function.dart';
import 'package:ebot/utility/constants.dart';
import 'package:flutter/material.dart';

class SingleConversions extends StatelessWidget {
  const SingleConversions({Key? key, required this.messages}) : super(key: key);
  static const String routeName = '/SingleConversions';
  final List<dynamic> messages;
  static getNavigator(List<dynamic> messages) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/SingleConversions"),
        builder: (c) {
          return SingleConversions(
            messages: messages,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg2,
        appBar: AppBar(
          centerTitle: true,
          title: myText("History"),
          leading: Container(),
          backgroundColor: bg,
        ),
        body: Column(
          children: [
            Container(
              color: bg2,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  if (messages[index]['isSuggestion'] == true) {
                    return suggestions(
                      context,
                      messages[index]['text'],
                      messages[index]['isMe'],
                    );
                  } else {
                    return single_chat(context, messages[index]['isMe'],
                        messages[index]['text']);
                  }
                },
              ),
            ),
          ],
        ));
  }
}

Widget single_chat(
  BuildContext context,
  bool isMe,
  String message,
) {
  return Row(
    mainAxisAlignment:
        isMe == true ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 20,
                  left: isMe == true
                      ? MediaQuery.of(context).size.width / 1.5
                      : 20,
                  right:
                      isMe == true ? 20 : MediaQuery.of(context).size.width / 3,
                  top: 20),
              decoration: BoxDecoration(
                  color:
                      isMe == true ? const Color.fromARGB(255, 79, 79, 79) : bg,
                  borderRadius: BorderRadius.only(
                      bottomLeft: isMe == true
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                      bottomRight: isMe == true
                          ? const Radius.circular(0)
                          : const Radius.circular(8),
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(8))),
              // width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myText(
                    message,
                  )),
            ),
          ],
        ),
      ),
    ],
  );
}

suggestions(
  BuildContext context,
  String message,
  bool isMe,
) {
  return Row(
    children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 0,
                  left: 20,
                  right: MediaQuery.of(context).size.width / 3,
                  top: 20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 53, 214, 67),
                  borderRadius: BorderRadius.only(
                      bottomLeft: isMe == true
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                      bottomRight: isMe == true
                          ? const Radius.circular(0)
                          : const Radius.circular(8),
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(8))),
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: myText("suggestion", color: black, size: 15),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myText(message, color: black)),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
