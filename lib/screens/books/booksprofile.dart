import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wamdha/config/dicl.dart';

// ignore: must_be_immutable
class Bookprofile extends StatelessWidget {
  Bookprofile({Key? key}) : super(key: key);
  Color col = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: rsiftlch(context),
            pinned: true,
            backgroundColor: Colors.black,
            toolbarHeight: 85,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.ac_unit_rounded),
              )
            ],
            expandedHeight: 350.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: My(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 5000,
            )
          ]))
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
              onTap: () {},
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
              onTap: () {},
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

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  late double indextrading = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthf(context),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://m.media-amazon.com/images/I/51v0zzrUsgL.jpg"))),
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
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/51v0zzrUsgL.jpg"))),
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
                    "Title Of Book",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$indextrading",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "dathsdh dkskk da",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Details :",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "orem ipsum zefef zefkzekgzkegkzke sit amet, consectetur adipiscing elit.orem ipsum zefef zefkzekgzkegkzke sit amet, consectetur adipiscing elit.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
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
