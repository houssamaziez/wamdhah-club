import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final spinkit = SpinKitCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.black : Color(0xFFE4E4E4),
      ),
    );
  },
);

Color whiat = Colors.white;
Color black = Colors.black;
widthf(context) {
  return MediaQuery.of(context).size.width;
}

height(context) {
  return MediaQuery.of(context).size.height;
}

var snapshot = user.snapshots();

CollectionReference user =
    FirebaseFirestore.instance.collection("collectionPath");
