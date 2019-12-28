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
      print('no login');
      prefs.clear();
      _auth.signOut();
      Navigator.pushReplacementNamed(context, '/login_page');
    }
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
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Icon(
                      Icons.local_laundry_service,
                      size: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: Text(
                      'Laundro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
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