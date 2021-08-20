import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

// ignore: must_be_immutable
class AddBook extends StatefulWidget {
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  late String name, image, Author, Read, download, Abstract;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

                    return Container();
                  }),
            ),
            TextFormField(
              onChanged: (c) {
                setState(() {
                  Read = c;
                });
              },
              decoration: InputDecoration(
                  labelText: "Read",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            TextFormField(
              onChanged: (c) {
                setState(() {
                  download = c;
                });
              },
              decoration: InputDecoration(
                  labelText: "download",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            TextFormField(
              onChanged: (c) {
                setState(() {
                  name = c;
                });
              },
              decoration: InputDecoration(
                  labelText: "name books",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            TextFormField(
              onChanged: (teext) {
                setState(() {
                  image = teext;
                });
              },
              decoration: InputDecoration(
                  labelText: "url image",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            TextFormField(
              onChanged: (teext) {
                setState(() {
                  Author = teext;
                });
              },
              decoration: InputDecoration(
                  labelText: "Author",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            TextFormField(
              onChanged: (c) {
                setState(() {
                  Abstract = c;
                });
              },
              decoration: InputDecoration(
                  labelText: "Abstract",
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          for (var i = 0; i < listAllBook.length; i++) {
            all.add(listAllBook[i]);
          }
          await collectionPath_Political_Books.add({
            "name": name,
            'image': image,
            "Author": Author,
            'Abstract': Abstract,
            "download": download,
            'Read': Read,
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
