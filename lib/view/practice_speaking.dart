import 'package:avatar_glow/avatar_glow.dart';
import 'package:ebot/controller/hive_db.dart';
import 'package:ebot/controller/practice_cupid.dart';
import 'package:ebot/model/pratice_state.dart';
import 'package:ebot/utility/common_function.dart';
import 'package:ebot/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PracticeSpeaking extends StatefulWidget {
  const PracticeSpeaking({Key? key}) : super(key: key);
  static const String routeName = '/PracticeSpeaking';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/PracticeSpeaking"),
        builder: (c) {
          return const PracticeSpeaking();
        });
  }

  @override
  State<PracticeSpeaking> createState() => _PracticeSpeakingState();
}

class _PracticeSpeakingState extends State<PracticeSpeaking> {
  @override
  initState() {
    super.initState();
    context.read<PracticeCupid>().startPractice();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   context.read<PracticeCupid>().stopPractice();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PracticeCupid, PraticeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<PracticeCupid>().makeItIntial();

            return true;
          },
          child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: const Text('Practice Speaking'),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.content_copy),
                      onPressed: () async {
                        AppHiveDb.setConversation(state.formattedMessages);
                      },
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(),
                      child: ListView.builder(
                        itemCount: state.formattedMessages.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (state.formattedMessages[index]['isSuggestion'] ==
                              true) {
                            return suggestions(context,
                                state.formattedMessages[index]['text']);
                          } else {
                            return single_chat(
                                context,
                                state.formattedMessages[index]['isMe'],
                                state.formattedMessages[index]['text']);
                          }
                        },
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child:
                                myText(state.currentUserTempText, color: black),
                          ),
                          AvatarGlow(
                            animate: state.onLinstening,
                            showTwoGlows: true,
                            duration: const Duration(milliseconds: 600),
                            endRadius: 75,
                            glowColor: Theme.of(context).primaryColor,
                            child: FloatingActionButton(
                              onPressed: () async {
                                await context
                                    .read<PracticeCupid>()
                                    .toggleRecording();
                              },
                              child: Icon(
                                  state.onLinstening
                                      ? Icons.mic
                                      : Icons.mic_none,
                                  size: 36),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }
}

Widget single_chat(
  BuildContext context,
  bool isMe,
  String message,
) {
  return Row(
    children: [
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 10,
                  left:
                      isMe == true ? MediaQuery.of(context).size.width / 3 : 10,
                  right:
                      isMe == true ? 10 : MediaQuery.of(context).size.width / 3,
                  top: 10),
              decoration: BoxDecoration(
                color: isMe == true
                    ? const Color(0xffebeff2)
                    : const Color(0xffebeff2),
                borderRadius: BorderRadius.circular(8),
              ),
              // width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myText(message, color: black)),
            ),
            isMe == false
                ? GestureDetector(
                    onTap: () {
                      context.read<PracticeCupid>().speak(message);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      margin: EdgeInsets.only(
                          bottom: 0,
                          left: isMe == true
                              ? MediaQuery.of(context).size.width / 3
                              : 10,
                          right: isMe == true ? 10 : 100,
                          top: 0),
                      decoration: BoxDecoration(
                          color: Colors.amber[100], shape: BoxShape.circle),
                      child: const Icon(Icons.volume_down),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    ],
  );
}

suggestions(
  BuildContext context,
  String message,
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
                  left: 10,
                  right: MediaQuery.of(context).size.width / 3,
                  top: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 38, 167, 49),
                borderRadius: BorderRadius.circular(8),
              ),
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
