import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return null!;
      // }),
      body: StreamBuilder<QuerySnapshot>(
          stream: user.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((document) {
                return new ListTile(
                  title: new Text(document['name']),
                  subtitle: new Text(document['name']),
                );
              }).toList(),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('collectionPath')
              .add({"name": "houssam"});
        },
      ),
    );
  }
}
