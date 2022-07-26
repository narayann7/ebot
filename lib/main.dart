import 'package:ebot/controller/practice_cupid.dart';
import 'package:ebot/view/practice_speaking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utility/coustom_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PracticeCupid>(
          create: (BuildContext context) => PracticeCupid(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PracticeSpeaking.routeName,
        onGenerateRoute: CustomRoutes.generateRoute,
      ),
    );
  }
}
