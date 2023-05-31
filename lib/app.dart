import 'package:flutter/material.dart';
import 'package:week_six/view/add_user_view.dart';

import 'view/display_user_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      initialRoute: '/addUser',
      routes: {
        '/addUser': (context) => const AddUserView(),
        '/viewUser': (context) => const DisplayUserView(),
      }
    );
  }
}