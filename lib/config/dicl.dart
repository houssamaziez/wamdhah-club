import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
widthf(context) {
  return MediaQuery.of(context).size.width;
}

height(context) {
  return MediaQuery.of(context).size.height;
}

var snapshot = user.snapshots();

CollectionReference user =
    FirebaseFirestore.instance.collection("collectionPath");
x() {}
Padding charit1({
  @override title,
  seeALLfunction = x,
  seeALL = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
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
                child: Text("See All"),
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
      onTap: () {},
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
              style: TextStyle(fontSize: 20),
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
