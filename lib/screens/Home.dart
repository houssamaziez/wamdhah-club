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
              Padding(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
                child: Row(
                  children: [
                    Text(
                      'Club Officials',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("See All"),
                    ),
                  ],
                ),
              ),
              clubOfficials(context, snapshot),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      'Last Added',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("See All"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: height(context) * 0.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!.docs.map((document) {
                      return Column(
                        children: [
                          Expanded(
                            child: books(
                              image: document['image'],
                              title: document['name'],
                            ),
                          ),
                          Text(
                            document['name'],
                            style: TextStyle(
                                fontSize: 15,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Text(
                  'Recent activities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs.map((document) {
                  return CircleAvatar(
                    radius: 43,
                    foregroundImage: NetworkImage(
                      document['image'],
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        });
  }

  Padding clubOfficials(
      BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: height(context) * 0.08,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((document) {
            return CircleAvatar(
              radius: 43,
              foregroundImage: NetworkImage(
                document['image'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
