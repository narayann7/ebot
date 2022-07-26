import 'package:ebot/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'utility/coustom_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Dashborad.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
