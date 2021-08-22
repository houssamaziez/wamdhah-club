import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/config/Function.dart';

import 'config/Button/bottom.dart';

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
    return ChangeNotifierProvider(
      create: (contex) => MyProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottm(),
      ),
    );
  }
}
