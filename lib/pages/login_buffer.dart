import 'dart:async';
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
      //User.gender = document.data['gender'];
      User.primaryAddress = document.data['primaryAddress'];
      User.primaryAddressLine1 = document.data['primaryAddressLine1'];
      User.primaryAddressLine2 = document.data['primaryAddressLine2'];
      User.primaryAddressCity = document.data['primaryAddressCity'];
      User.primaryAddressState = document.data['primaryAddressState'];
      User.pincode = document.data['primaryAddressPincode'];
      User.aadharNumber=document.data['aadharNumber'];
      User.panNumber=document.data['panNumber'];
      User.maxIroning=document.data['maxIroning'];
      User.maxWashing=document.data['maxWashing'];
      User.maxDryCleaning=document.data['maxDryCleaning'];
      prefs.setString('loggedInUserEmail', User.email);
      prefs.setString('loggedInUserUid', User.uid);
      prefs.setString('loggedInUserDisplayName', User.displayName);
      prefs.setString('loggedInUserPhoneNumber', User.phone);
      prefs.setString('loggedInUserDOB', User.dob.toString());
      //prefs.setString('loggedInUserGender', User.gender);
      prefs.setString(
          'loggedInUserPrimaryAddressLine1', User.primaryAddressLine1);
      prefs.setString(
          'loggedInUserPrimaryAddressLine2', User.primaryAddressLine2);
      prefs.setString(
          'loggedInUserPrimaryAddressCity', User.primaryAddressCity);
      prefs.setString(
          'loggedInUserPrimaryAddressState', User.primaryAddressState);
      prefs.setString('loggedInUserPrimaryAddressPincode', User.pincode);
      prefs.setString('loggedInUserPrimaryAddress', User.primaryAddress);
      prefs.setString('loggedInUserAadharNumber', User.aadharNumber);
      prefs.setString('loggedInUserPanNumber', User.panNumber);
      prefs.setString('loggedInUserMaxIroning', User.maxIroning);
      prefs.setString('loggedInUserMaxWashing', User.maxWashing);
      prefs.setString('loggedInUserMaxDryCleaning', User.maxDryCleaning);
      navigateToHome();
    } else {
      navigateToDetails();
    }
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home_page');
  }

  void navigateToDetails() {
    Navigator.pushReplacementNamed(context, '/intial_user_details');
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
                    child: Icon(Icons.local_laundry_service),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
