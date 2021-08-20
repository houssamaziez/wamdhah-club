import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/Home.dart';
import 'package:wamdha/screens/books/addboks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    getDataToList(all, listAllBook);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
