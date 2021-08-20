import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/books/booksprofile.dart';
import 'package:wamdha/screens/profile.dart';

// ignore: camel_case_types
class books extends StatefulWidget {
  final title, image, author, details, dowload, read, tkhss;
  const books({
    Key? key,
    @override this.title,
    @override this.tkhss,
    @override this.image,
    @override this.author,
    @override this.details,
    @override this.dowload,
    @override this.read,
  }) : super(key: key);

  @override
  State<books> createState() => _booksState();
}

// ignore: camel_case_types
class _booksState extends State<books> {
  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 6,
            child: InkWell(
              onTap: () {
                setState(() {
                  imageclck = widget.image;
                  title = widget.title;
                  author = widget.author;
                  details = widget.details;
                  dowload = widget.dowload;
                  tkhss = widget.tkhss;

                  read = widget.read;
                  switch (tkhss) {
                    case "S":
                      collaction = collectionPath_Scientific;

                      break;
                    case "R":
                      collaction = collectionPath_Religious;

                      break;
                    case "P":
                      collaction = collectionPath_Political_Books;

                      break;
                    case "H":
                      collaction = collectionPath_Human_Development;

                      break;
                    default:
                  }
                });

                Navigator.push(
                    context,
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return Bookprofile();
                      },
                      settings: RouteSettings(name: 'houssam'),
                      fullscreenDialog: true,
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.image,
                    ),
                  ),
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: widthf(context) * 0.4,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: IconButton(
                      onPressed: () {
                        print('favorite ');
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

clubOfficials(
  BuildContext context,
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
) {
  return Stack(
    children: [
      Container(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((document) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black26,
                foregroundImage: NetworkImage(
                  document['image'],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                offset: Offset(15.0, 0.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],
            color: Colors.transparent,
          ),
          height: 80,
          margin: const EdgeInsets.only(bottom: 6.0),
          width: 30,
        ),
      )
    ],
  );
}

Widget lastadded(
    BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  return Stack(
    children: [
      Container(
        height: height(context) * 0.35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((document) {
            return Column(
              children: [
                Expanded(
                  child: books(
                    author: document['Author'],
                    details: document['Abstract'],
                    dowload: document['download'],
                    read: document['Read'],
                    image: document['image'],
                    title: document['name'],
                    tkhss: document['T'],
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
      Positioned(
        right: 0,
        bottom: 15,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                offset: Offset(16.0, 0.0), //(x,y)
                blurRadius: 35.0,
              ),
            ],
            color: Colors.transparent,
          ),
          height: height(context) * 0.30,
          width: 40,
        ),
      ),
    ],
  );
}
