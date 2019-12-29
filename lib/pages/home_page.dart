import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundro_shop_app/components/side_drawer.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/pages/active_orders.dart';
import 'package:laundro_shop_app/pages/new_orders.dart';
import 'package:laundro_shop_app/pages/previous_orders.dart';
import 'package:laundro_shop_app/pages/summary_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _pageTitles = [
    'New Orders',
    'Active Orders',
    'Previous Orders',
    'Summary',
  ];
  final List<Widget> _pages = [
    NewOrders(),
    ActiveOrders(),
    PreviousOrders(),
    SummaryPage(),
  ];
  BottomNavigationBarItem _buildNavigationItem(
      int index, IconData iconData, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: nonSelectedIconColor,
      ),
      activeIcon: Icon(
        iconData,
        color: selectedIconColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index
              ? selectedIconColor
              : nonSelectedIconColor,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_pageTitles[_selectedIndex]),
          backgroundColor:Color(0XFF6bacde),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildNavigationItem(0, FontAwesomeIcons.list, _pageTitles[0]),
            _buildNavigationItem(1, FontAwesomeIcons.checkSquare, _pageTitles[1]),
            _buildNavigationItem(2, FontAwesomeIcons.clipboardCheck, _pageTitles[2]),
            _buildNavigationItem(3, Icons.message, _pageTitles[3]),
          ],
        ),
        drawer: SideDrawer(),
        body: _pages[_selectedIndex],
      ),
    );
  }
}