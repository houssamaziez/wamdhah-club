import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/Home.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    Timer(Duration(hours: 7), () {
      Navigator.pop(context);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "images/iconwamdha.png",
                      ),
                    ),
                  ),
                ),
              ),
              spinkit,
            ],
          ),
        ));
  }
}
