import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Function.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';

import '../listview.dart';
import 'listbook/Gridbook.dart';

class ListOfBook extends StatefulWidget {
  const ListOfBook({Key? key}) : super(key: key);

  @override
  State<ListOfBook> createState() => _ListOfBookState();
}

class _ListOfBookState extends State<ListOfBook> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Books"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          charit1(
              title: 'Religious Books',
              seeALL: true,
              seeALLfunction: () {
                setState(() {
                  allalow = false;

                  prov.tkhss = "R";
                });
                push(context: context, screen: GirdBook());
              }),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Religious.limit(5).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: spinkit);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: spinkit);
                  }

                  return lastadded(context, snapshot);
                }),
          ),
          charit1(
              title: 'The Scientific Books',
              seeALL: true,
              seeALLfunction: () {
                setState(() {
                  allalow = false;
                  prov.tkhss = "S";
                });
                push(context: context, screen: GirdBook());
              }),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Scientific.limit(5).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: spinkit);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: spinkit);
                  }

                  return lastadded(context, snapshot);
                }),
          ),
          charit1(
              title: 'Human Development',
              seeALL: true,
              seeALLfunction: () {
                setState(() {
                  allalow = false;
                  prov.tkhss = "H";
                });
                push(context: context, screen: GirdBook());
              }),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Human_Development.limit(5).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: spinkit);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: spinkit);
                  }

                  return lastadded(context, snapshot);
                }),
          ),
          charit1(
              title: 'Political Books',
              seeALL: true,
              seeALLfunction: () {
                setState(() {
                  allalow = false;
                  prov.tkhss = "P";
                });
                push(context: context, screen: GirdBook());
              }),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Political_Books.limit(5).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: spinkit);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: spinkit);
                  }

                  return lastadded(context, snapshot);
                }),
          ),
          charit1(
              title: 'ALL Books',
              seeALL: true,
              seeALLfunction: () {
                setState(() {
                  allalow = true;
                });
                push(context: context, screen: GirdBook());
              }),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: all.limit(5).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: spinkit);
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: spinkit);
                  }

                  return lastadded(context, snapshot);
                }),
          ),
        ],
      ),
    );
  }
}

bool allalow = false;
