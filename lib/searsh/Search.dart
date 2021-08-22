import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/config/Function.dart';

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
    final prov = Provider.of<MyProvider>(context);
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
          prov.index(0);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var list = [];
    final dd = query.isEmpty
        ? list
        : listAllBookName.where(
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
              push(
                context: context,
                screen: Pageresult(dd.elementAt(index)),
              );
            },
          );
        });
  }
}
