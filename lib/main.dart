import 'package:flutter/material.dart';
import 'package:laundro_shop_app/pages/active_orders.dart';
import 'package:laundro_shop_app/pages/contact_us.dart';
import 'package:laundro_shop_app/pages/home_page.dart';
import 'package:laundro_shop_app/pages/initial_shop_information_page.dart';
import 'package:laundro_shop_app/pages/login_buffer.dart';
import 'package:laundro_shop_app/pages/login_page.dart';
import 'package:laundro_shop_app/pages/new_orders.dart';
import 'package:laundro_shop_app/pages/password_reset_page.dart';
import 'package:laundro_shop_app/pages/previous_orders.dart';
import 'package:laundro_shop_app/pages/register_page.dart';
import 'package:laundro_shop_app/pages/splash_page.dart';
import 'package:laundro_shop_app/pages/summary_page.dart';
import 'package:laundro_shop_app/pages/about_page.dart';
import 'package:laundro_shop_app/pages/initial_user_details.dart';
import 'package:laundro_shop_app/pages/initial_address_details.dart';
import 'package:laundro_shop_app/pages/my_account.dart';
import 'package:laundro_shop_app/pages/test_page.dart';

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
        '/about_page':(context)=>AboutPage(),
        '/initial_user_details':(context)=>InitialShopDetails(),
        '/initial_shop_information':(context)=>ShopDetails(),
        '/initial_address_details':(context)=>ShopAddress(),
        '/buffer_page':(context)=>BufferPage(),
        '/myaccount_page':(context)=>MyAccount(),
        '/test_page':(context)=>TestPage(),
        '/contact_us':(context)=>ContactUs(),
      },
    );
  }
}
