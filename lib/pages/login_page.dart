import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  bool showSpinner = false;
  bool circularSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    instantiateSP();
    checkForPermissions();
  }

  void checkForPermissions() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    ServiceStatus serviceStatus =
        await LocationPermissions().checkServiceStatus();
    PermissionStatus p;
    if (permission == PermissionStatus.unknown) {
      p = await LocationPermissions().requestPermissions();
    }
    if (serviceStatus == ServiceStatus.disabled) {
      Alert(
          context: context,
          title: 'Please enable your location services',
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Okay'),
            ),
          ]).show();
    }
    if (permission == PermissionStatus.denied) {
      Alert(
          context: context,
          title:
              'Please give us permission in application\'s settings to get your location to deliver your clothes right to you.',
          buttons: [
            DialogButton(
              onPressed: () async {
                bool isOpened = await LocationPermissions().openAppSettings();
              },
              child: Text('Open settings'),
            ),
          ],
          closeFunction: () {
            checkForPermissions();
          }).show();
    }
  }

  void instantiateSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Hero(
        tag: 'logo',
        child: Container(
          height: 3 * (MediaQuery.of(context).size.height / 20),
          width: 7 * (MediaQuery.of(context).size.width / 10),
          child: Image.asset('images/app_logo/gimmePartner.png'),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 1.5 * (MediaQuery.of(context).size.height / 20),
        width: 8 * (MediaQuery.of(context).size.width / 10),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            email = value;
          },
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            labelText: 'Email',
            labelStyle: kLabelStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 1.5 * (MediaQuery.of(context).size.height / 20),
        width: 8 * (MediaQuery.of(context).size.width / 10),
        child: TextField(
          obscureText: true,
          onChanged: (value) {
            password = value;
          },
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            labelText: 'Password',
            labelStyle: kLabelStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/reset_password');
          },
          child: Container(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
            child: Text(
              'Forgot Password ?',
              style: kLabelStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      height: 1.4 * (MediaQuery.of(context).size.height / 20),
      width: 8 * (MediaQuery.of(context).size.width / 10),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            showSpinner = true;
          });
          try {
            final firebaseUser = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            if (firebaseUser != null) {
              final currentFirebaseUser = await _auth.currentUser();
              loggedInUser = currentFirebaseUser;
              User.email = loggedInUser.email;
              User.uid = loggedInUser.uid;
              print(User.email + User.uid);
              final userCheck = await _firestore
                  .collection('shop')
                  .where('email', isEqualTo: User.email)
                  .limit(1)
                  .getDocuments();
              final userCheckList = userCheck.documents;
              if (userCheckList.length == 1) {
                Navigator.pushReplacementNamed(context, '/buffer_page');
              } else {
                Navigator.pushReplacementNamed(
                    context, '/initial_user_details');
              }
            }
          } catch (e) {
            print(e);
          }
          setState(() {
            showSpinner = false;
          });
        },
        //padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: mainColor,
            letterSpacing: 1.5,
            fontSize: MediaQuery.of(context).size.height / 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    _buildEmailTF(),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildLoginBtn(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
