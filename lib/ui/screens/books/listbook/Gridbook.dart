import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Function.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/ui/screens/books/listofbook.dart';
import 'package:wamdha/ui/screens/listview.dart';

class GirdBook extends StatefulWidget {
  @override
  State<GirdBook> createState() => _GirdBookState();
}

class _GirdBookState extends State<GirdBook> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: allalow == true
              ? all.snapshots()
              : all
                  .where(
                    "T",
                    isEqualTo: prov.tkhss,
                  )
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: spinkit);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: spinkit);
            }
            var docs = snapshot.data!.docs;
            return GridView.builder(
              itemCount: docs.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return books(
                  author: docs[index]["Author"],
                  details: docs[index]["Abstract"],
                  dowload: docs[index]["download"],
                  image: docs[index]["image"],
                  read: docs[index]["Read"],
                  title: docs[index]["name"],
                  tkhss: docs[index]["T"],
                );
              },
            );
          }),
    );
  }
}
