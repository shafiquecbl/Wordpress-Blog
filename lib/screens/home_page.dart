import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordpress_blog/constants.dart';
import 'package:wordpress_blog/screens/categories_list.dart';
import 'package:wordpress_blog/screens/posts_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wordpress_blog/widgets/app_dawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        drawer: MyAppDrawer(),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ));
  }

  AppBar appBar() {
    return AppBar(
        iconTheme: IconThemeData.fallback(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: websiteLogo());
  }

  Widget websiteLogo() {
    return Container(
      height: 45,
      child: CachedNetworkImage(
        imageUrl: websiteLogoUrl,
        placeholder: (context, string) {
          return websiteTitle();
        },
        errorWidget: (context, string, dynamic) {
          return websiteTitle();
        },
      ),
    );
  }

  Widget websiteTitle() {
    return Text(
      websiteName,
      style: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [PostsList(), CategoriesList()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category),
        title: ("Categories"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
