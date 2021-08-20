import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

import '../listview.dart';

class ListOfBook extends StatelessWidget {
  const ListOfBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Books"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          charit1(
              title: 'Religious Books', seeALL: true, seeALLfunction: () {}),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Religious.snapshots(),
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
              seeALLfunction: () {}),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Scientific.snapshots(),
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
              title: 'Human Development', seeALL: true, seeALLfunction: () {}),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Human_Development.snapshots(),
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
              title: 'Political Books', seeALL: true, seeALLfunction: () {}),
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionPath_Political_Books.snapshots(),
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
