import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Var.dart';

class MyProvider extends ChangeNotifier {
  MyProvider();
  int indexBottom = 0;

  late String imageclck, title, author, details, dowload, read, tkhss;
  notifyListeners();

  index(i) {
    indexBottom = i;
    notifyListeners();
  }

  indexratin() {
    notifyListeners();
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 0,
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
          },
        ),
      ],
    );
  }

  ff({image1, title1, author1, details1, dowload1, tkhss1, read1}) {
    imageclck = image1;
    title = title1;
    author = author1;
    details = details1;
    dowload = dowload1;
    tkhss = tkhss1;

    read = read1;
    switch (tkhss1) {
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
    notifyListeners();
  }
}
    // final prov = Provider.of<MyProvider>(context);
