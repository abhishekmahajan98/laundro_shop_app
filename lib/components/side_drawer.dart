import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          //header
          UserAccountsDrawerHeader(
            accountName: Text('name'),
            accountEmail: Text('email'),
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
            onTap: () {},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/summary_page'),
            child: ListTile(
              title: Text('Summary'),
              leading: Icon(
                Icons.view_list,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/previous_orders'),
            child: ListTile(
              title: Text('Previous Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/new_orders'),
            child: ListTile(
              title: Text('New Orders'),
              leading: Icon(
                Icons.fiber_new,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/active_orders'),
            child: ListTile(
              title: Text('Active Orders'),
              leading: Icon(
                Icons.directions_run,
                color: Color(0xFF73AEF5),
              ),
            ),
          ),

          Divider(
            color: Color(0xFF73AEF5),
            height: 5,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/about'),
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
            onTap: () {},
            child: ListTile(
              title: Text('Logout'),
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
