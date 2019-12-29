import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 1),
      (){
        instantiateSP();
        } 
    );
  }
  void instantiateSP() async{
    prefs = await SharedPreferences.getInstance();
    checkLoggedInStatus();
  }

  void checkLoggedInStatus() async{
    if(prefs.containsKey('loggedInUserEmail')){
      try{
        User.email=prefs.getString('loggedInUserEmail');
        User.uid=prefs.getString('loggedInUserUid');
        User.phone=prefs.getString('loggedInUserPhoneNumber');
        User.displayName=prefs.getString('loggedInUserDisplayName');
        User.dob=DateTime.parse(prefs.getString('loggedInUserDOB'));
        User.primaryAddress=prefs.getString('loggedInUserPrimaryAddress');
        User.primaryAddressLine1=prefs.getString('loggedInUserPrimaryAddressLine1');
        User.primaryAddressLine2=prefs.getString('loggedInUserPrimaryAddressLine2');
        User.primaryAddressCity=prefs.getString('loggedInUserPrimaryAddressCity');
        User.primaryAddressState=prefs.getString('loggedInUserPrimaryAddressState');
        User.pincode=prefs.getString('loggedInUserPrimaryAddressPincode');
        User.aadharNumber=prefs.getString('loggedInUserAadharNumber');
        User.panNumber=prefs.getString('loggedInUserPanNumber');
        User.maxIroning=prefs.getString('loggedInUserMaxIroning');
        User.maxWashing=prefs.getString('loggedInUserMaxWashing');
        User.maxDryCleaning=prefs.getString('loggedInUserMaxDryCleaning');
    
        Navigator.pushReplacementNamed(context, '/home_page');
      }
      catch(e){
        print(e);
        prefs.clear();
        _auth.signOut();
        Navigator.pushReplacementNamed(context, '/login_page');
        
      }
    }
    else{
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
            color: Color(0XFF6bacde),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/app_logo/LOGO1.png',
                width: 300,
                ),

            ],
          ),
        ),
      ),
    );
  }
}