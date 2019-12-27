import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InitialShopDetails extends StatefulWidget {

  @override
  _InitialShopDetails createState() => _InitialShopDetails();
}

class _InitialShopDetails extends State<InitialShopDetails> {
  String name;
  String phone='';
  DateTime dob;
  DateTime selectedDate = DateTime.now();
  String selectedDay;
  String selectedMonth;
  String selectedYear;

  String aadharcard;
  String pancard;
  Widget _buildName(){
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
            name=value;
          });

        },

        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Name',
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),

    );


  }
  Widget _buildphone(){
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
      child: TextField(
        onChanged: (value) {
          setState(() {
            phone=value;
          });

        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color:Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,

          labelText: "Phone Number" ,
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
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
        dob = picked;
      });
  }
  Widget _buildDOB(){
    return ListTile(

      contentPadding: EdgeInsets.all(0),

      title: Container(
        alignment: Alignment.centerLeft,
        height: 60.0,
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
        child: TextField(
          enabled: false,


          decoration: InputDecoration(

            border: InputBorder.none,
            hintText: selectedDay!=null?"DOB:   "+selectedDay+"/"+selectedMonth+"/"+selectedYear:'Select your DOB',
            contentPadding:EdgeInsets.only(left: 40.0),
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),

          ),
          onChanged: (value){
            setState(() {
            });
          },
        ),
      ),
      trailing: GestureDetector(
        child: Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
        onTap: () async{
          await _selectDate(context);
          selectedDay=dob.day.toString();
          selectedMonth=dob.month.toString();
          selectedYear=dob.year.toString();
          print(dob.toString());
        },
      ),
    );
  }
  Widget _buildaadharnumber(){
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
      child: TextField(
        onChanged: (value) {
          setState(() {
            aadharcard=value;
          });

        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
            color: Colors.white
        ),
        decoration: InputDecoration(
          border: InputBorder.none,

          labelText: "Aadhaar card number" ,
          contentPadding: EdgeInsets.only(top: 4.0,left: 44.0),
          labelStyle: TextStyle(color: Colors.white),

        ),
      ),
    );

  }

  Widget _buildpannumber(){
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
      child: TextField(
        onChanged: (value) {
          setState(() {
            pancard=value;
          });

        },
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,

          labelText: "Pan card number" ,
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
            if(name!='' && phone.length==10 && dob!=null ){

              Navigator.pushReplacementNamed(context, '/address');
            }
            else{
              Alert(
                  context: context,
                  title: 'Please fill the form ',
                  desc:
                  'Please fill the name,10 digit phone number and the Date of birth',
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
