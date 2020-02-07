import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      instantiateSP();
    });
  }

  void instantiateSP() async {
    prefs = await SharedPreferences.getInstance();
    checkLoggedInStatus();
  }

  void checkLoggedInStatus() async {
    if (prefs.containsKey('loggedInUserEmail')) {
      try {
        User.email = prefs.getString('loggedInUserEmail');
        User.uid = prefs.getString('loggedInUserUid');
        User.phone = prefs.getString('loggedInUserPhoneNumber');
        User.displayName = prefs.getString('loggedInUserDisplayName');
        User.dob = DateTime.parse(prefs.getString('loggedInUserDOB'));
        User.primaryAddress = prefs.getString('loggedInUserPrimaryAddress');
        User.placeName = prefs.getString('loggedInUserPlaceName');
        User.locality = prefs.getString('loggedInUserLocality');
        User.administrativeArea =
            prefs.getString('loggedInUserAdministrativeArea');
        User.landmark = prefs.getString('loggedInUserLandmark');
        User.pincode = prefs.getString('loggedInUserPincode');
        User.lattitude = prefs.getDouble('loggedInUserLattitude');
        User.longitude = prefs.getDouble('loggedInUserLongitude');
        Navigator.pushReplacementNamed(context, '/home_page');

        //Navigator.pushReplacementNamed(context, '/test_page');
      } catch (e) {
        print(e);
        prefs.clear();
        _auth.signOut();
        Navigator.pushReplacementNamed(context, '/login_page');
      }
    } else {
      prefs.clear();
      _auth.signOut();
      Navigator.pushReplacementNamed(context, '/login_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/app_logo/gimmePartner.png',
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
