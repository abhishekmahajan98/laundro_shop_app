import 'dart:async';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BufferPage extends StatefulWidget {
  @override
  _BufferPageState createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  final _firestore = Firestore.instance;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      instantiateSP();
      retrieveUserData();
    });
  }

  void instantiateSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  void retrieveUserData() async {
    final document =
        await _firestore.collection('shop').document(User.uid).get();
    if (document.data['displayName'] != null &&
        document.data['phoneNumber'] != null &&
        document.data['primaryAddress'] != null) {
      User.displayName = document.data['displayName'];
      User.dob = DateTime.parse(document.data['dob']);
      User.phone = document.data['phoneNumber'];
      User.primaryAddress = document.data['primaryAddress'];
      User.pincode = document.data['pincode'];
      User.landmark = document.data['landmark'];
      User.locality = document.data['locality'];
      User.placeName = document.data['placeName'];
      User.administrativeArea = document.data['administrativeArea'];
      GeoPoint p = document.data['geoLocation'];
      User.lattitude = p.latitude;
      User.longitude = p.longitude;
      prefs.setString('loggedInUserEmail', User.email);
      prefs.setString('loggedInUserUid', User.uid);
      prefs.setString('loggedInUserDisplayName', User.displayName);
      prefs.setString('loggedInUserPhoneNumber', User.phone);
      prefs.setString('loggedInUserDOB', User.dob.toString());
      prefs.setString('loggedInUserPlaceName', User.placeName);
      prefs.setString('loggedInUserLocality', User.locality);
      prefs.setString('loggedInUserPincode', User.pincode);
      prefs.setString(
          'loggedInUserAdministrativeArea', User.administrativeArea);
      prefs.setString('loggedInUserPrimaryAddress', User.primaryAddress);
      prefs.setString('loggedInUserLandmark', User.landmark);
      prefs.setDouble('loggedInUserLattitude', User.lattitude);
      prefs.setDouble('loggedInUserLongitude', User.longitude);
      navigateToHome();
    } else {
      navigateToDetails();
    }
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home_page');
  }

  void navigateToDetails() {
    Navigator.pushReplacementNamed(context, '/initial_user_details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0XFF6bacde),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/app_logo/LOGO1.png',
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AwesomeLoader(
                    loaderType: AwesomeLoader.AwesomeLoader3,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
