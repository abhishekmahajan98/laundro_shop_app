import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/get_periodic_earning.dart';
import 'package:laundro_shop_app/components/total_clothes_stream.dart';
import 'package:laundro_shop_app/components/total_payments_stream.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  DateTime fromDate;
  //DateTime selectedDate = DateTime.now();
  String fromDay;
  String fromMonth;
  String fromYear;
  DateTime toDate;
  String toDay;
  String toMonth;
  String toYear;
  bool spinner=false;
  Future<void> _selectfromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now()
      );
    if (picked != null && picked != fromDate)
      setState(() {
        fromDate = picked;
      });
  }
  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now()
      );
    if (picked != null && picked != toDate)
      setState(() {
        toDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff2f3f7),
        ),
        child: Column(
          children: <Widget>[
            TotalPaymentsStream(),
            
            TotalClothesStream(),
            Expanded(
              flex: 7,
              child: Container(
                color: Color(0xfff2f3f7),
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 30),
                            leading: Text(
                              '₹',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            title: Text(
                              'Periodic earning',
                              style: kCategoryTextStyle,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                              await _selectfromDate(context);
                              if(fromDate!=null){
                                fromDay=fromDate.day.toString();
                                fromMonth=fromDate.month.toString();
                                fromYear=fromDate.year.toString();
                              }
                            },
                            child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 25),
                            leading: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            title: Container(
                              alignment: Alignment.centerLeft,
                              height: 60.0, 
                              child: TextField(
                                textAlign: TextAlign.left,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: fromDay!=null?"From: "+fromDay+"/"+fromMonth+"/"+fromYear:'Select First Date',
                                  contentPadding:EdgeInsets.only(left: 10.0),
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value){
                                  setState(() {
                                  });
                                },
                              ),
                            ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                              await _selecttoDate(context);
                              if(toDate!=null){
                                toDay=toDate.day.toString();
                                toMonth=toDate.month.toString();
                                toYear=toDate.year.toString();
                              }
                            },
                            child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 25),
                            leading: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            title: Container(
                              alignment: Alignment.centerLeft,
                              height: 60.0, 
                              child: TextField(
                                textAlign: TextAlign.left,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: toDay!=null?"To: "+toDay+"/"+toMonth+"/"+toYear:'Select Second Date',
                                  contentPadding:EdgeInsets.only(left: 8.0),
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value){
                                  setState(() {
                                  });
                                },
                              ),
                            ),
                            ),
                          ),
                            ListTile( 
                              title: Text(
                                'Calculate earning:',
                                style: kCategoryTextStyle,
                              ),
                              trailing: RaisedButton(
                                color: Color(0XFF6bacde),
                                onPressed: ()async{
                                  try{
                                    if(toDate!=null && fromDate!=null){
                                      if(fromDate.isBefore(toDate) && toDate.isBefore(DateTime.now())){
                                        setState(() {
                                          spinner=true;
                                        });
                                        double earnings=await getEarningBetween(fromDate, toDate);
                                        setState(() {
                                          spinner=false;
                                        });
                                        Alert(
                                          context:context,
                                          title: 'Periodic Earning',
                                          desc: "Earning bewteen "+fromDay+"/"+fromMonth+"/"+fromYear+" and "+toDay+"/"+toMonth+"/"+fromYear+" is:",
                                          content: Column(
                                            children: <Widget>[
                                              Text('₹ '+earnings.toString()),
                                            ],
                                          ),
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                'Okay',
                                                style: TextStyle(
                                                  color: Colors.white
                                                ),
                                                ),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                            )
                                          ]
                                        ).show();
                                      }
                                      else if(toDate.isBefore(fromDate)){
                                        Alert(
                                          context:context,
                                          title: 'Wrong Dates',
                                          desc: '2nd date cannot be before the 1st date!',
                                        ).show();
                                      }
                                    }
                                    else{
                                      Alert(
                                          context:context,
                                          title: 'Please fill both dates.',
                                        ).show();
                                    }
                                  }
                                  catch(e){
                                    print(e);
                                    Alert(
                                      context: context,
                                      title: 'Something went wrong',
                                      desc: 'Please try later.',
                                    ).show();
                                  }
                                },
                                child: Text(
                                  'show',
                                  style:TextStyle(
                                    color: Colors.white,
                                  )
                                  ),
                              ),
                            ),                  
                        ],
                      ),
                    )
                  ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
