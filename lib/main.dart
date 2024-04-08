import 'package:flutter/material.dart';
import 'package:train/Api_UserList.dart';
import 'package:train/Practice_User.dart';
import 'package:train/UserList.dart';
import 'package:train/home.dart';

import 'Practice_Api_List.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Api_UserList(),
      debugShowCheckedModeBanner: false,
    );
  }
}