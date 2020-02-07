import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:laundro_shop_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialShopDetails extends StatefulWidget {
  @override
  _InitialShopDetails createState() => _InitialShopDetails();
}

class _InitialShopDetails extends State<InitialShopDetails> {
  DateTime dob;
  DateTime selectedDate = DateTime.now();
  String selectedDay;
  String selectedMonth;
  String selectedYear;
  SharedPreferences prefs;
  String phone = '';
  String displayName = '';

  Widget _buildName() {
    return TextFormField(
      initialValue: User.displayName,
      onChanged: (value) {
        setState(() {
          User.displayName = value;
        });
      },
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'Name',
        contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildphone() {
    return TextFormField(
      initialValue: User.phone,
      onChanged: (value) {
        setState(() {
          phone = value;
        });
      },
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: "Phone Number",
        contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != dob)
      setState(() {
        User.dob = picked;
      });
  }

  Widget _buildDOB() {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: selectedDay != null
              ? "DOB:   " +
                  selectedDay +
                  "/" +
                  selectedMonth +
                  "/" +
                  selectedYear
              : 'Select your DOB',
          contentPadding: EdgeInsets.only(left: 40.0),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
      trailing: GestureDetector(
        child: Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
        onTap: () async {
          await _selectDate(context);
          selectedDay = User.dob.day.toString();
          selectedMonth = User.dob.month.toString();
          selectedYear = User.dob.year.toString();
          //print(dob.toString());
        },
      ),
    );
  }

  Widget _buildaadharnumber() {
    return TextField(
      onChanged: (value) {
        setState(() {
          User.aadharNumber = value;
        });
      },
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Aadhaar card number",
        contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildpannumber() {
    return TextField(
      onChanged: (value) {
        setState(() {
          User.panNumber = value;
        });
      },
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: "Pan card number",
        contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
        labelStyle: TextStyle(color: Colors.white),
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
            color: mainColor,
          ),
          onPressed: () {
            if (phone != null) {
              User.phone = phone;
            }
            if (User.displayName != '' &&
                User.displayName != null &&
                phone.length == 10 &&
                User.dob != null) {
              //print(User.displayName);
              Navigator.pushReplacementNamed(context, '/initial_location_page');
            } else {
              Alert(
                  context: context,
                  title: 'Please fill the Details Properly ',
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
              color: mainColor,
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
                  _buildName(),
                  SizedBox(height: 30.0),
                  _buildphone(),
                  SizedBox(height: 30.0),
                  _buildDOB(),
                  SizedBox(height: 30.0),
                  _buildaadharnumber(),
                  SizedBox(height: 30.0),
                  _buildpannumber(),
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
