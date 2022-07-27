import 'package:ebot/utility/common_function.dart';
import 'package:ebot/utility/constants.dart';
import 'package:ebot/view/conversations.dart';
import 'package:ebot/view/practice_speaking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({Key? key}) : super(key: key);
  static const String routeName = '/Dashborad';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Dashborad"),
        builder: (c) {
          return const Dashborad();
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: bg,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: bg2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    {
                      teleport(context, PracticeSpeaking.routeName);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: bg, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          myText("Practice Speaking"),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: gold)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    {
                      teleport(context, Conversation.routeName);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: bg, borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          myText("Conversations"),
                          const Icon(Icons.history,
                              // color: Colors.white,
                              color: gold)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
