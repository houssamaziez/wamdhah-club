import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wamdha/config/Providers.dart';
import 'package:wamdha/config/Var.dart';
import 'package:wamdha/searsh/Search.dart';

class Bottm extends StatelessWidget {
  const Bottm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          listwidget[prov.indexBottom],
          BottomNavigatorBar(context),
        ],
      ),
    );
  }

  Widget BottomNavigatorBar(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);

    Expanded buttonBOTTM({nomeIcon, ind, function = false}) {
      return Expanded(
        child: InkWell(
          onTap: () {
            // ignore: unnecessary_statements
            function == true
                ? showSearch(context: context, delegate: Search())
                // ignore: unnecessary_statements
                : null;
            prov.index(ind);
            function();
          },
          child: Container(
            child: Center(
              child: Icon(
                nomeIcon,
                color: prov.indexBottom == ind && function == false
                    ? Colors.black
                    : Colors.grey,
                size: prov.indexBottom == ind ? 40 : 30,
              ),
            ),
          ),
        ),
      );
    }

    return Positioned(
      bottom: 0,
      child: Container(
        height: 50,
        color: Colors.white.withOpacity(0.7),
        width: widthf(context),
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: Row(
                children: [
                  buttonBOTTM(
                    nomeIcon: Icons.home,
                    ind: 0,
                  ),
                  buttonBOTTM(nomeIcon: Icons.search, ind: 0, function: true),
                  buttonBOTTM(nomeIcon: Icons.book, ind: 2),
                  buttonBOTTM(nomeIcon: Icons.person, ind: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
