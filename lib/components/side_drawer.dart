import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
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
              color: mainColor,
            ),
          ),
          //body
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/myaccount_page'),
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: mainColor,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/about_page'),
            child: ListTile(
              title: Text('About us'),
              leading: Icon(
                Icons.help,
                color: mainColor,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/contact_us'),
            child: ListTile(
              title: Text('Contact us'),
              leading: Icon(
                Icons.contact_phone,
                color: mainColor,
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, '/payment_settlement_page'),
            child: ListTile(
              title: Text('Payment Settlement'),
              leading: Icon(
                Icons.attach_money,
                color: mainColor,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
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
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
