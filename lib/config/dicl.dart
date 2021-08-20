import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wamdha/searsh/Search.dart';

List kk = [];
getDataToList(collcaction, $list) async {
  var dd = await collcaction.get().then((value) => value.docs);

  for (var i = 0; i < dd.length; i++) {
    var ddd = dd[i].data();
    $list.add(ddd);
  }
  ss();
}

ss() {
  listAllBook.forEach((element) {
    listAllBookName.add(element["name"]);
  });
}

goUrl({@required url}) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}

// list data
var listAllBook = [];
var listAllBookName = [];
// entent screen

void goNoback(BuildContext context, {@override screen}) {
  Navigator.pop(context);

  Navigator.push(context, MaterialPageRoute(builder: (context) => screen()));
}
// ___________________________________________________

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
// size
widthf(context) {
  return MediaQuery.of(context).size.width;
}

height(context) {
  return MediaQuery.of(context).size.height;
}

// les donnes

late String imageclck, title, author, details, dowload, read, tkhss;

//____________________________________ collaction__________________________________
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

//______________________________________________________________________
x() {}
Padding charit1({
  @override title,
  seeALLfunction = x,
  seeALL = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20, right: 5),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        seeALL == true
            ? TextButton(
                onPressed: () {
                  seeALLfunction();
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            : Container(),
      ],
    ),
  );
}

Expanded cHOIX({@override title, function}) {
  return Expanded(
    child: InkWell(
      onTap: () async {},
      child: Container(
        child: Center(
          child: Text(title),
        ),
      ),
    ),
  );
}

Widget searsh(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: InkWell(
      onTap: () {
        showSearch(context: context, delegate: Search());
      },
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Text(
              "Search",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: widthf(context),
        height: 45,
      ),
    ),
  );
}
