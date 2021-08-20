import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/Home.dart';

import '../listview.dart';

// ignore: must_be_immutable
class Bookprofile extends StatefulWidget {
  @override
  State<Bookprofile> createState() => _BookprofileState();
}

class _BookprofileState extends State<Bookprofile> {
  late double indextrading = 0;

  Color col = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: rsiftlch(context),
            pinned: true,
            backgroundColor: Colors.black,
            toolbarHeight: 85,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
            ],
            expandedHeight: 350.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: MyBarProfileBook(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            charit1(title: 'Recommend', seeALL: true, seeALLfunction: () {}),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: collaction.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: spinkit);
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: spinkit);
                    }

                    return lastadded(context, snapshot);
                  }),
            ),
            charit1(title: 'More Details', seeALL: false),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text(
                details,
              ),
            ),
            charit1(title: 'Rate the book', seeALL: false),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RatingBar.builder(
                    initialRating: indextrading,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      setState(() {
                        indextrading = rating;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$indextrading",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: widthf(context),
              height: 49,
            )
          ])),
        ],
      ),
    );
  }

  PreferredSize rsiftlch(BuildContext context) {
    return PreferredSize(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                goUrl(url: read);
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.article_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Read Now",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
              width: 0,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                goUrl(url: dowload);
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.download_for_offline_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "download",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )),
            VerticalDivider(
              color: Colors.white,
              thickness: 1,
              width: 0,
            ),
            Expanded(
                child: InkWell(
              onTap: () {},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Collection",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
        decoration: BoxDecoration(
          color: col.withOpacity(0.4),
        ),
        height: 54,
        width: widthf(context),
      ),
      preferredSize: const Size.fromHeight(0.0),
    );
  }
}

class MyBarProfileBook extends StatefulWidget {
  const MyBarProfileBook({Key? key}) : super(key: key);

  @override
  State<MyBarProfileBook> createState() => _MyBarProfileBookState();
}

class _MyBarProfileBookState extends State<MyBarProfileBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthf(context),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageclck))),
      child: Container(
        color: Color(0xFF7A7171).withOpacity(0.7),
        height: widthf(context),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: height(context) * 0.2,
                width: widthf(context) * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageclck))),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Author :",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          author,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rating :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class Teltch extends StatelessWidget {
  const Teltch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: widthf(context),
      height: 20,
    );
  }
}
