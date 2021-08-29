import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_redesign/pages/dashboard.dart';
import 'package:netflix_redesign/pages/my_movie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CusBottomBar extends StatefulWidget {
  const CusBottomBar({Key? key}) : super(key: key);

  @override
  _CusBottomBarState createState() => _CusBottomBarState();
}

class _CusBottomBarState extends State<CusBottomBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int selected = 0;

  List<Widget> _buildScreen() {
    return [
      DashBoard(),
      Center(
        child: Text("Second Page"),
      ),
      MyMovie(),
      Center(
        child: Text("four Page"),
      ),
      Center(
        child: Text("five Page"),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "images/home.svg",
          height: 30,
          color: selected == 0 ? Color(0xffE61E25) : Color(0xff545454),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "images/calendar.svg",
          height: 30,
          color: selected == 1 ? Color(0xffE61E25) : Color(0xff545454),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: Offset(0, -8),
          child: CircleAvatar(
            backgroundColor: Color(0xffE61E25),
            radius: 25,
            child: SvgPicture.asset(
              'images/movie.svg',
              height: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "images/Discover.svg",
          height: 30,
          color: selected == 3 ? Color(0xffE61E25) : Color(0xff545454),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "images/profile-circle.svg",
          height: 30,
          color: selected == 4 ? Color(0xffE61E25) : Color(0xff545454),
        ),
      ),
    ];
  }

  void _onItemtapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: _onItemtapped,
      screens: _buildScreen(),
      items: _navBarItems(),
      backgroundColor: Color.fromRGBO(17, 16, 16, 0.6),
      navBarStyle: NavBarStyle.simple,
    );
  }
}
