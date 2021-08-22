import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/config/Function.dart';
import 'package:wamdha/ui/screens/books/booksprofile.dart';
import 'package:wamdha/ui/screens/profile.dart';

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
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
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
                prov.ff(
                  author1: widget.author,
                  details1: widget.details,
                  dowload1: widget.dowload,
                  image1: widget.image,
                  read1: widget.read,
                  title1: widget.title,
                  tkhss1: widget.tkhss,
                );
                push(context: context, screen: Bookprofile());
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
            right: 12,
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
  return Container(
    color: Color(0xFFF2F2F2),
    height: 110,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: snapshot.data!.docs.map((document) {
        return InkWell(
          onTap: () {
            push(
              context: context,
              screen: Profile(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  color: Colors.grey,
                  offset: Offset(0.0, 5.0), //(x,y)
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                minRadius: 39,
                backgroundColor: whiat,
                maxRadius: 39,
                child: CircleAvatar(
                  minRadius: 35,
                  maxRadius: 35,
                  backgroundColor: Colors.black26,
                  foregroundImage: NetworkImage(
                    document['image'],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
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
