import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';
import 'package:wamdha/screens/profile.dart';

class books extends StatelessWidget {
  final title, image;
  const books({
    Key? key,
    @override this.title,
    @override this.image,
  }) : super(key: key);

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
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              width: widthf(context) * 0.4,
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

Padding clubOfficials(
  BuildContext context,
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
      height: height(context) * 0.08,
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
              radius: 43,
              backgroundColor: Colors.black26,
              foregroundImage: NetworkImage(
                document['image'],
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}

Widget lastadded(
    BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  return Padding(
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
  );
}
