import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class ShopAddress extends StatefulWidget {
  @override
  _ShopAddressState createState() => _ShopAddressState();
}

class _ShopAddressState extends State<ShopAddress> {
  Widget _buildLine1(){
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
            User.primaryAddressLine1=value;
          });

        },

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Line 1',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildLine2(){
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
            User.primaryAddressLine2=value;
          });

        },

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Line 2',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildcity(){
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
            User.primaryAddressCity=value;
          });

        },

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'City',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildstate(){
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
            User.primaryAddressState=value;
          });

        },

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'State',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildpincode(){
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
            User.pincode=value;
          });

        },
        keyboardType: TextInputType.phone,

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Pincode',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _nextbutton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Next',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
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
          onPressed: (){
            if(User.primaryAddressLine1.length>0 && User.pincode.length==6 ){

              Navigator.pushReplacementNamed(context, '/initial_shop_information');
            }
            else{
              Alert(
                  context: context,
                  title: 'Please fill the Details properly ',
                  
                  buttons: [
                    DialogButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]).show();
            }
          },),
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
                    'Address Details',
                    style: TextStyle(
                      color: Colors.white,
                      //fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildLine1(),
                  SizedBox(height: 30.0),
                  _buildLine2(),
                  SizedBox(height: 30.0),
                  _buildcity(),
                  SizedBox(height: 30.0),
                  _buildstate(),
                  SizedBox(height: 30.0),
                  _buildpincode(),
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

