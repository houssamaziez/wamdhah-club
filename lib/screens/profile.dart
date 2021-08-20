import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

import 'listview.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream: all.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: spinkit);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: spinkit);
            }
            return ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: height(context) * 0.2,
                        width: widthf(context),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.data!.docs[2]['image'])),
                        ),
                      ),
                    ),
                    Container(
                        height: height(context) * 0.4,
                        width: widthf(context),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Column(
                          children: [],
                        )),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.black45,
                          radius: 55,
                          backgroundImage:
                              NetworkImage(snapshot.data!.docs[1]['image']),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      child: Text(
                        "data",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 50,
                        width: widthf(context),
                        child: Row(
                          children: [
                            cHOIX(title: "activity"),
                            VerticalDivider(
                              width: 0,
                              color: Colors.black38,
                            ),
                            cHOIX(title: "information"),
                            VerticalDivider(
                              color: Colors.black26,
                              width: 0,
                            ),
                            cHOIX(title: "Books"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    lastadded(context, snapshot),
                  ],
                )
              ],
            );
          }),
    );
  }
}
