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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PracticeCupid, PraticeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<PracticeCupid>().makeItIntial();

            if (state.formattedMessages.length >= 2) {
              await AppHiveDb.setConversation(state.formattedMessages);
            }

            return true;
          },
          child: Scaffold(
              backgroundColor: bg2,
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: bg,
                title: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/bot.png",
                        height: 30.0,
                        width: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            myText(state.botWillSpeak == true
                                ? "Speaking"
                                : state.onLinstening == true
                                    ? "listening"
                                    : ""),
                            state.botWillSpeak == true ||
                                    state.onLinstening == true
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/loading.gif",
                                      height: 40.0,
                                      width: 40.0,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                centerTitle: true,
                leading: Container(),
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
                            return suggestions(
                                context,
                                state.formattedMessages[index]['text'],
                                state.formattedMessages[index]['isMe']);
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
                      decoration: const BoxDecoration(color: bg),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: myText(
                              state.currentUserTempText,
                            ),
                          ),
                          AvatarGlow(
                            animate: state.onLinstening,
                            showTwoGlows: true,
                            duration: const Duration(milliseconds: 600),
                            endRadius: 75,
                            glowColor: gold,
                            child: FloatingActionButton(
                              backgroundColor: state.botWillSpeak
                                  ? const Color.fromARGB(255, 79, 79, 79)
                                  : gold,
                              onPressed: () async {
                                if (state.botWillSpeak == false) {
                                  await context
                                      .read<PracticeCupid>()
                                      .toggleRecording();
                                }
                              },
                              child: Icon(
                                state.onLinstening ? Icons.mic : Icons.mic_none,
                                size: 36,
                                color: bg,
                              ),
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
                  bottom: 10,
                  left:
                      isMe == true ? MediaQuery.of(context).size.width / 3 : 20,
                  right:
                      isMe == true ? 20 : MediaQuery.of(context).size.width / 3,
                  top: 10),
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
                  padding: const EdgeInsets.all(10.0),
                  child: myText(
                    message,
                  )),
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
                              : 20,
                          right: isMe == true ? 20 : 100,
                          top: 0),
                      decoration: const BoxDecoration(
                          color: bg, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.volume_down,
                        color: Colors.white,
                      ),
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
