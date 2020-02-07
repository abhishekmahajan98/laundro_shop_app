import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';

final _firestore = Firestore.instance;

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: Container(
          margin: EdgeInsets.only(left: 30),
          width: double.infinity,
          height: 60,
          child: RaisedButton(
            color: mainColor,
            onPressed: () {
              _firestore
                  .collection('shopInfoChangeRequests')
                  .document()
                  .setData({
                'requestTime': DateTime.now(),
                'shopId': User.uid,
                'processed': false,
              }).then((val) {
                Alert(
                  context: context,
                  title: 'Request Sent!',
                  desc:
                      'We will call you soon to get the details regarding the change soon! Please sit tight.It usually takes anywhere from a few hours to 2 days to process the request.',
                  buttons: [
                    DialogButton(
                      color: mainColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Okay'),
                    )
                  ],
                ).show();
              });
            },
            child: Text(
              'Request Change',
              style: kCategoryTextStyle,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("My Account"),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xfff2f3f7),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      User.displayName == null ? '' : User.displayName,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff2f3f7),
                  ),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListTile(
                          title: TextFormField(
                            enabled: false,
                            initialValue: User.email,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListTile(
                          title: TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.phone,
                            initialValue: User.phone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              prefixText: '+91-',
                            ),
                          ),
                          trailing: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                              title: Text(
                                'Primary Address',
                                style: TextStyle(fontSize: 18),
                              ),
                              trailing: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            ListTile(
                              leading: Text("Line 1       "),
                              title: TextFormField(
                                enabled: false,
                                keyboardType: TextInputType.text,
                                initialValue: User.primaryAddress,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    //updatedAddressLine1 = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: Text("Landmark"),
                              title: TextFormField(
                                enabled: false,
                                keyboardType: TextInputType.text,
                                initialValue: User.landmark,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    //updatedAddressLine2 = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: Text("Pincode   "),
                              title: TextFormField(
                                initialValue: User.pincode,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                enabled: false,
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  setState(() {
                                    //updatedPincode = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
