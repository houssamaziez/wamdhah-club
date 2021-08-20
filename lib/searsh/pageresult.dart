import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/books/booksprofile.dart';
import 'package:wamdha/screens/profile.dart';

class Pageresult extends StatefulWidget {
  final title;

  const Pageresult(this.title);

  @override
  State<Pageresult> createState() => _PageresultState();
}

class _PageresultState extends State<Pageresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: all.where("name", isEqualTo: widget.title).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: spinkit);
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: spinkit);
              }
              var docs = snapshot.data!.docs;
              return Center(
                child: ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(docs[index]['name']),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onTap: () {
                          setState(() {
                            imageclck = docs[index]["image"];
                            title = docs[index]["name"];
                            author = docs[index]["Author"];
                            details = docs[index]["Abstract"];
                            dowload = docs[index]["download"];
                            tkhss = docs[index]["T"];
                            read = docs[index]["Read"];
                            switch (tkhss) {
                              case "S":
                                collaction = collectionPath_Scientific;

                                break;
                              case "R":
                                collaction = collectionPath_Religious;

                                break;
                              case "P":
                                collaction = collectionPath_Political_Books;

                                break;
                              case "H":
                                collaction = collectionPath_Human_Development;

                                break;
                              default:
                            }
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                                  return Bookprofile();
                                },
                                fullscreenDialog: true,
                              ));
                        },
                      );
                    }),
              );
            }),
      ),
    );
  }
}
