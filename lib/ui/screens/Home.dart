import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/config/Function.dart';

import 'books/listofbook.dart';
import 'listview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Are you sure to get out?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('no')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('yes')),
                ],
              );
            });
      },
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: background,
          leading: Icon(
            Icons.menu,
            color: black.withOpacity(0.5),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: black.withOpacity(0.5),
                ),
              ),
            )
          ],
          elevation: 0,
        ),
        body: NewWidget(
          collection: all,
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final collection;
  const NewWidget({
    @override this.collection,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: spinkit);
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: spinkit);
          }

          return ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              charit1(
                  title: 'Club Officials', seeALL: true, seeALLfunction: () {}),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      collectionPath_clubOfficials.orderBy("num").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: spinkit);
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: spinkit);
                    }

                    return clubOfficials(context, snapshot);
                  }),
              charit1(
                  title: 'Last Added',
                  seeALLfunction: () {
                    push(context: context, screen: ListOfBook());
                  }),
              lastadded(context, snapshot),
              SizedBox(
                height: 30,
              ),
              actvtyclub(),
              SizedBox(
                height: 10,
              ),
              charit1(
                  title: 'Last Added', seeALLfunction: () {}, seeALL: false),
              nchat(snapshot, context),
            ],
          );
        });
  }

  Container actvtyclub() {
    return Container(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          buttonchoix(
            image: 'images/c1.png',
            title: 'سجل النشاطات',
          ),
          Spacer(),
          buttonchoix(
            title: 'احداث القادمة',
            image: 'images/c2.png',
          ),
          Spacer(),
          SizedBox(
            width: 10,
          ),
          buttonchoix(
            title: 'الاحداث',
            image: 'images/c3.png',
          ),
          Spacer(),
          SizedBox(
            width: 20,
          ),
          buttonchoix(
            title: 'مناقشة',
            image: 'images/c4.png',
          ),
          SizedBox(
            width: 2,
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget nchat(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: snapshot.data!.docs.map((document) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widthf(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            document['image'],
                          )),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.black12,
                    ),
                    height: 200,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Text('definition'),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
