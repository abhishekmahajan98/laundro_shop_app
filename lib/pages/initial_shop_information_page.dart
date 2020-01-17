import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  SharedPreferences prefs;
  final _firestore = Firestore.instance;
  //String ironing='';
  //String washing='';
  //String drycleaning='';
  @override
  initState() {
    super.initState();
    instantiateSP();
  }

  void instantiateSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget _buildironing() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF6CA8F1),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            User.maxIroning = value;
          });
        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can iron in day',
          contentPadding: EdgeInsets.only(top: 4.0, left: 10.0),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildwashing() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF6CA8F1),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            User.maxWashing = value;
          });
        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can wash in a day',
          contentPadding: EdgeInsets.only(top: 4.0, left: 10.0),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _builddrycleaning() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF6CA8F1),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            User.maxDryCleaning = value;
          });
        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can dry clean in day',
          contentPadding: EdgeInsets.only(top: 4.0, left: 10.0),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _nextbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Next',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onPressed: () {
            if (User.maxIroning.length > 0 &&
                User.maxWashing.length > 0 &&
                User.maxDryCleaning.length > 0) {
              prefs.setString('loggedInUserDisplayName', User.displayName);
              prefs.setString('loggedInUserPhoneNumber', User.phone);
              prefs.setString('loggedInUserDOB', User.dob.toString());

              //prefs.setString('loggedInUserPrimaryAddressLine1', User.primaryAddressLine1);
              //prefs.setString('loggedInUserPrimaryAddressLine2', User.primaryAddressLine2);
              //prefs.setString('loggedInUserPrimaryAddressCity', User.primaryAddressCity);
              //prefs.setString('loggedInUserPrimaryAddressState', User.primaryAddressState);
              prefs.setString(
                  'loggedInUserPrimaryAddressPincode', User.pincode);
              prefs.setString(
                  'loggedInUserPrimaryAddress', User.primaryAddress);
              _firestore.document('shop/' + User.uid).setData({
                'email': User.email,
                'displayName': User.displayName,
                'phoneNumber': User.phone,
                'dob': User.dob.toString(),
                'primaryAddress': User.primaryAddress,
                //'primaryAddressLine1': User.primaryAddressLine1,
                //'primaryAddressLine2': User.primaryAddressLine2,
                //'primaryAddressCity': User.primaryAddressCity,
                //'primaryAddressState': User.primaryAddressState,
                'primaryAddressPincode': User.pincode,
                'primaryAddress': User.primaryAddress,
                'maxironing': User.maxIroning,
                'maxWashing': User.maxWashing,
                'maxDryCleaning': User.maxDryCleaning,
                'aadharNumber': User.aadharNumber,
                'panNumber': User.panNumber,
              });
              Navigator.pushReplacementNamed(context, '/home_page');
            } else {
              Alert(
                  context: context,
                  title: 'Please Enter Minimum 50 clothes  ',
                  buttons: [
                    DialogButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]).show();
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
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
          Container(
            height: double.infinity,
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Extra Details',
                    style: TextStyle(
                      color: Colors.white,
                      //fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildironing(),
                  SizedBox(height: 30.0),
                  _buildwashing(),
                  SizedBox(height: 30.0),
                  _builddrycleaning(),
                  SizedBox(height: 30.0),
                  _nextbutton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
