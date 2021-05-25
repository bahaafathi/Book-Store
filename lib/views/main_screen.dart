import 'package:flutter/material.dart';
import 'package:book_store/util/dialogs.dart';
import 'package:book_store/views/explore/explore.dart';
import 'package:book_store/views/home/home.dart';
import 'package:book_store/views/settings/settings.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    // disable or override the back button "WillPopScope"
    return WillPopScope(
      onWillPop: () => Dialogs().showExitDialog(context),
      child: Scaffold(
        body: PageView(
          //physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged, //بتعرفك رقم الصفحه الي واقف عليها
          children: <Widget>[
            Home(),
            Explore(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.grey[500],
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Home',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.compass,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Explore',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.settings,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Settings',
              ),
            ),
          ],
          onTap: navigationTapped, //بيديك رقم الصفحه الي داس عليها
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  ///قبل لما البولد تشتغل هيخلي رقم اول صفحه 0
  ///عشان لو البيولد اشتغلت هيجي ايرور
  ///عشان البيدج فيو مش هيعرف يقف علي انهي صفحه اصلا

  ///cause memory leak.

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
