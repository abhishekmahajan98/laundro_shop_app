import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/side_drawer.dart';
import 'package:laundro_shop_app/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Icon(
            Icons.local_laundry_service,
          ),
        ),
        drawer: SideDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/new_orders');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        'New Orders',
                        style: kMainTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/active_orders');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        'Active orders',
                        style: kMainTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/previous_orders');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            'Previous Orders',
                            style: kMainTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/summary_page');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            'Summary',
                            style: kMainTextStyle,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
