import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

import 'listview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiat,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: whiat,
        leading: Icon(
          Icons.menu,
          color: black.withOpacity(0.5),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: black.withOpacity(0.5),
            ),
          )
        ],
        elevation: 0,
      ),
      body: NewWidget(
        collection: user,
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
                height: 10,
                // Searsh
              ),
              searsh(context),
              charit1(
                  title: 'Club Officials', seeALL: true, seeALLfunction: () {}),
              clubOfficials(context, snapshot),
              charit1(title: 'Last Added', seeALLfunction: () {}),
              lastadded(context, snapshot),
              charit1(
                  title: 'Last Added', seeALLfunction: () {}, seeALL: false),
              nchat(snapshot, context),
            ],
          );
        });
  }

  ListView nchat(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, context) {
    return ListView(
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
    );
  }
}
