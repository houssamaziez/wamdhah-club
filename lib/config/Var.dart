import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/ui/screens/Home.dart';

// Colors
Color whiat = Colors.white;
Color black = Colors.black;
Color background = Color(0xFFF2F2F2);
// list
List kk = [];
var listAllBook = [];
var listAllBookName = [];

var listwidget = [
  Home(),
  Scaffold(backgroundColor: Colors.white),
  Scaffold(
    backgroundColor: Colors.black,
  ),
  Scaffold(backgroundColor: Colors.white),
];

// variable

// size
widthf(context) {
  return MediaQuery.of(context).size.width;
}

height(context) {
  return MediaQuery.of(context).size.height;
}
// collaction

var collaction;

Stream<QuerySnapshot<Object?>> snapshot = all.snapshots();
CollectionReference all = FirebaseFirestore.instance.collection("AllBooks");
// ignore: non_constant_identifier_names
CollectionReference collectionPath_Scientific = FirebaseFirestore.instance
    .collection("books")
    .doc('The Scientific Books')
    .collection("books");
// ignore: non_constant_identifier_names
CollectionReference collectionPath_Religious = FirebaseFirestore.instance
    .collection("books")
    .doc('Religious Books')
    .collection("books"); // ignore: non_constant_identifier_names
// ignore: non_constant_identifier_names
CollectionReference collectionPath_Human_Development = FirebaseFirestore
    .instance
    .collection("books")
    .doc('Human Development')
    .collection("books");
// ignore: non_constant_identifier_names
CollectionReference collectionPath_Political_Books = FirebaseFirestore.instance
    .collection("books")
    .doc('Political Books')
    .collection("books");
// ignore: non_constant_identifier_names
CollectionReference collectionPath_clubOfficials =
    FirebaseFirestore.instance.collection("clubOfficials");
