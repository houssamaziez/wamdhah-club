import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wamdha/config/dicl.dart';

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
            elevation: 20,
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
