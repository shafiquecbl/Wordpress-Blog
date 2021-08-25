import 'package:flutter/material.dart';
import 'package:wordpress_blog/widgets/Social_Media_Icons.dart';
import 'package:wordpress_blog/widgets/button.dart';
import 'package:wordpress_blog/widgets/divider.dart';
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(children: [
              MyButton(text: 'About Us', uRl: aboutUs),
              MyDivider(),
              MyButton(text: 'Contact Us', uRl: contactUS),
              MyDivider(),
              MyButton(text: 'Privacy Policy', uRl: privacyPolicy),
              MyDivider(),
            ])),
            SocialMedia(),
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
