import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laundro_shop_app/models/user_model.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  SharedPreferences prefs;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          //header
          UserAccountsDrawerHeader(
            accountName: Text(User.displayName),
            accountEmail: Text(User.email),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF73AEF5),
                  )),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF73AEF5),
            ),
          ),
          //body
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/myaccount_page'),
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/about_page'),
            child: ListTile(
              title: Text('About us'),
              leading: Icon(
                Icons.help,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/contactus'),
            child: ListTile(
              title: Text('Contact us'),
              leading: Icon(
                Icons.contact_phone,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: ()  async {
              prefs = await SharedPreferences.getInstance();
              prefs.clear();
              _auth.signOut();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/login_page", (Route<dynamic> route) => false);
            },
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: ()  {
              Navigator.pushNamed(context, '/test_page');
            },
            child: ListTile(
              title: Text('Test Page'),
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
