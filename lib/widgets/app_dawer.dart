import 'package:flutter/material.dart';

import '../constants.dart';

class MyAppDrawer extends StatelessWidget {
  // const MyAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(context),
    );
  }

  Widget row(BuildContext context) {
    return Row(children: [blackIconTiles(context)]);
  }

  Widget blackIconTiles(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.6,
        color: complexDrawerBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 50, left: 15, right: 15),
              child: Container(
                child: Text(
                  websiteName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'About Us',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Divider(
                  color: greyColor,
                  thickness: 0.5,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Divider(
                  color: greyColor,
                  thickness: 0.5,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Divider(
                  color: greyColor,
                  thickness: 0.5,
                ),
              ),
            ])),
            accountTile()
          ],
        ));
  }

  Widget accountButton({bool usePadding = true, String url}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: complexDrawerBlueGrey,
      child: ListTile(
        leading: accountButton(usePadding: false, url: photoURL),
        title: Text(
          "M.SHAFIQUE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          "Flutter Developer",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
