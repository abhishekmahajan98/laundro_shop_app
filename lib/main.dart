import 'package:flutter/material.dart';
import 'package:laundro_shop_app/pages/active_orders.dart';
import 'package:laundro_shop_app/pages/home_page.dart';
import 'package:laundro_shop_app/pages/login_page.dart';
import 'package:laundro_shop_app/pages/new_orders.dart';
import 'package:laundro_shop_app/pages/password_reset_page.dart';
import 'package:laundro_shop_app/pages/previous_orders.dart';
import 'package:laundro_shop_app/pages/register_page.dart';
import 'package:laundro_shop_app/pages/splash_page.dart';
import 'package:laundro_shop_app/pages/summary_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundro Shop',
      routes: {
        '/': (context) => SplashScreen(),
        '/home_page': (context) => HomePage(),
        '/new_orders': (context) => NewOrders(),
        '/active_orders': (context) => ActiveOrders(),
        '/previous_orders': (context) => PreviousOrders(),
        '/summary_page': (context) => SummaryPage(),
        '/register_page': (context) => RegisterScreen(),
        '/reset_password': (context) => ResetPasswordScreen(),
        '/login_page': (context) => LoginScreen(),
      },
    );
  }
}
