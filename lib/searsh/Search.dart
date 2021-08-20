import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/books/booksprofile.dart';
import 'package:wamdha/searsh/pageresult.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final listv = listAllBookName.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final dd = listAllBookName.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
        itemCount: dd.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dd.elementAt(index)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return Pageresult(dd.elementAt(index));
                },
              ));
            },
          );
        });
  }
}
