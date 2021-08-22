import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Function.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/ui/screens/books/booksprofile.dart';

class Pageresult extends StatelessWidget {
  final title;

  const Pageresult(this.title);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: all.where("name", isEqualTo: title).snapshots(),
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
                          prov.imageclck = docs[index]["image"];
                          prov.title = docs[index]["name"];
                          prov.author = docs[index]["Author"];
                          prov.details = docs[index]["Abstract"];
                          prov.dowload = docs[index]["download"];
                          prov.tkhss = docs[index]["T"];
                          prov.read = docs[index]["Read"];
                          switch (prov.tkhss) {
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

                          push(
                            context: context,
                            screen: Bookprofile(),
                          );
                        },
                      );
                    }),
              );
            }),
      ),
    );
  }
}
