import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  String ironing='';
  String washing='';
  String drycleaning='';

  Widget _buildironing(){
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
            ironing=value;
          });

        },
        keyboardType: TextInputType.phone,


        style: TextStyle(

          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can iron in day',
          contentPadding: EdgeInsets.only(top: 4.0,left: 10.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildwashing(){
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
            washing=value;
          });

        },
        keyboardType: TextInputType.phone,


        style: TextStyle(

          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can wash in a day',
          contentPadding: EdgeInsets.only(top: 4.0,left: 10.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _builddrycleaning(){
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
            drycleaning=value;
          });

        },
        keyboardType: TextInputType.phone,


        style: TextStyle(

          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'No of clothes you can dry clean in day',
          contentPadding: EdgeInsets.only(top: 4.0,left: 10.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
