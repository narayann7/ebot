import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utility/constants.dart';

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
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  // final String _newVoiceText = "hello world";

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Practice Speaking'),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.amber[100]),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.white),
            )
          ],
        ));
  }
}

// Widget single_chat(
//   BuildContext context,
//   bool isMe,
//   String message,
// ) {
//   return Row(
//     mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//     children: [
//       isMe == false
//           ? Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 30,
//                 width: 30,
//                 decoration: const BoxDecoration(shape: BoxShape.circle),
//                 child: const Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           : Container(),
//       Flexible(
//         child: Column(
//           crossAxisAlignment:
//               isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                   bottom: 10,
//                   left:
//                       isMe == true ? MediaQuery.of(context).size.width / 3 : 10,
//                   right: isMe == true ? 10 : 100,
//                   top: 20),
//               decoration: BoxDecoration(
//                 color: isMe == true
//                     ? const Color(0xff5d8dd5)
//                     : const Color(0xffebeff2),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               // width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   message,
//                   style: const TextStyle(
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
