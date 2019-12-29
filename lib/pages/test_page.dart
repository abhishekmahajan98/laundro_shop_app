import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _firestore = Firestore.instance;
  DateTime selectedDate;
  String selectedDay;
  String selectedMonth;
  String selectedYear;
  String name='';
  String orderid;
  String customerUid='Xej3sc1jxZUYmrtaAJJ5UkhkGSA3';
  String shopId='V82NM6YNC0YNgPznoZR3Yxae5AI3',serviceName;
  String addressLine1,addressLine2,city,state,pincode,customerPhoneNumber;
  String bedsheets,jeans,pillowCovers,saree,tshirt,towel;
  String totalClothes,orderSubtotal,orderDeliveryPricePayable,orderDeliveryPrice,orderCommission,totalOrderPrice;
   Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now()
      );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev order input page'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Text('customerName'),
            title: TextField(
              onChanged: (value){
                name=value;
              },
            ),
          ),
          ListTile(
            leading: Text('customerPhoneNumber'),
            title: TextField(
              onChanged: (value){
                customerPhoneNumber=value;
              },
            ),
          ),
          ListTile(
            leading: Text('customerUid'),
            title: TextFormField(
              initialValue: 'Xej3sc1jxZUYmrtaAJJ5UkhkGSA3',
              onChanged: (value){
                customerUid=value;
              },
            ),
          ),
          ListTile(
            leading: Text('shopId'),
            title: TextFormField(
              initialValue: 'V82NM6YNC0YNgPznoZR3Yxae5AI3',
              onChanged: (value){
                customerUid=value;
              },
            ),
          ),    
          ListTile(
            leading: Text('orderid'),
            title: TextFormField(
              onChanged: (value){
                orderid=value;
              },
            ),
          ),      
          ListTile(
            leading: Text('addressLine1'),
            title: TextField(
              onChanged: (value){
                addressLine1=value;
              },
            ),
          ),
          ListTile(
            leading: Text('addressLine2'),
            title: TextField(
              onChanged: (value){
                addressLine2=value;
              },
            ),
          ),
          ListTile(
            leading: Text('city'),
            title: TextField(
              onChanged: (value){
                city=value;
              },
            ),
          ),
          ListTile(
            leading: Text('state'),
            title: TextField(
              onChanged: (value){
                state=value;
              },
            ),
          ),
          ListTile(
            leading: Text('pincode'),
            title: TextField(
              onChanged: (value){
                pincode=value;
              },
            ),
          ),
          ListTile(
            leading: Text('bedsheets'),
            title: TextField(
              onChanged: (value){
                bedsheets=value;
              },
            ),
          ),
          ListTile(
            leading: Text('pillowCovers'),
            title: TextField(
              onChanged: (value){
                pillowCovers=value;
              },
            ),
          ),
          ListTile(
            leading: Text('jeans'),
            title: TextField(
              onChanged: (value){
                jeans=value;
              },
            ),
          ),
          ListTile(
            leading: Text('tshirt'),
            title: TextField(
              onChanged: (value){
                tshirt=value;
              },
            ),
          ),
          ListTile(
            leading: Text('towel'),
            title: TextField(
              onChanged: (value){
                towel=value;
              },
            ),
          ),
          ListTile(
            leading: Text('saree'),
            title: TextField(
              onChanged: (value){
                saree=value;
              },
            ),
          ),
          ListTile(
            leading: Text('total clothes'),
            title: TextField(
              onChanged: (value){
                totalClothes=value;
              },
            ),
          ),
          ListTile(
            leading: Text('order subtotal'),
            title: TextField(
              onChanged: (value){
                orderSubtotal=value;
              },
            ),
          ),
          ListTile(
            leading: Text('orderDeliveryPrice'),
            title: TextField(
              onChanged: (value){
                orderDeliveryPrice=value;
              },
            ),
          ),
          ListTile(
            leading: Text('orderDeliveryPricePayable'),
            title: TextField(
              onChanged: (value){
                orderDeliveryPricePayable=value;
              },
            ),
          ),
          ListTile(
            leading: Text('orderCommission'),
            title: TextField(
              onChanged: (value){
                orderCommission=value;
              },
            ),
          ),
          ListTile(
            leading: Text('totalOrderPrice'),
            title: TextField(
              onChanged: (value){
                totalOrderPrice=value;
              },
            ),
          ),
          ListTile(
            leading: Text('serviceName'),
            title: TextField(
              onChanged: (value){
                serviceName=value;
              },
            ),
          ),
         GestureDetector(
              onTap: () async{
                await _selectDate(context);
                if(selectedDate!=null){
                  selectedDay=selectedDate.day.toString();
                  selectedMonth=selectedDate.month.toString();
                  selectedYear=selectedDate.year.toString();
                }
              },
              child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              leading: Text('OrderTimestamp'),
              title: Container(
                alignment: Alignment.centerLeft,
                height: 60.0, 
                child: TextField(
                  textAlign: TextAlign.left,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: selectedDay!=null?"To: "+selectedDay+"/"+selectedMonth+"/"+selectedYear:'Select order timestamp',
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
          Container(
            height: 50,
            child: RaisedButton(
              color: Colors.blue,
              
              onPressed: (){
                String primaryAddress=addressLine1+'+'+addressLine2+'+'+city+'+'+state+'+'+pincode;
                _firestore.collection('orders').document(orderid).setData({
                  'customerName':name,
                  'customerPhoneNumber':customerPhoneNumber,
                  'customerUid':customerUid,
                  'shopId':shopId,
                  'shopPhoneNumber':'9810163269',
                  'subscription':"none",
                  'subscriptionId':"none",
                  'isPickedUp':false,
                  'clothList':{
                    'bedsheets':bedsheets,
                    'pant/jeans':jeans,
                    'pillowCovers':pillowCovers,
                    'saree':saree,
                    't-shirt/shirt/kurta':tshirt,
                    'towel':towel,
                  },
                  'totalClothes':totalClothes,
                  'totalOrderPrice':totalOrderPrice,
                  'orderCommission':orderCommission,
                  'orderDeliveryPricePayable':orderDeliveryPricePayable,
                  'orderDeliveryPrice':orderDeliveryPrice,
                  'orderStatus':'confirmed',
                  'orderSubtotal':orderSubtotal,
                  'orderTimestamp':selectedDate,
                  'orderid':orderid,
                  'otp':'1234',
                  'paymentId':'123',
                  'serviceArea':'Pohteri',
                  'addressLine1':addressLine1,
                  'addressLine2':addressLine2,
                  'city':city,
                  'state':state,
                  'pincode':pincode,
                  'paymentMethod':"online",
                  'primaryAddress':primaryAddress,
                  'serviceName':serviceName,
                });
                Alert(
                  context: context,
                  title: 'order added!!',
                ).show();
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}