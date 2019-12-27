import 'package:flutter/material.dart';

class PreviousOrdersBox extends StatefulWidget {
  PreviousOrdersBox({this.orderId,
  this.customerName,
  this.serviceType,
  this.customerPhoneNumber,
  this.addressline1,
  this.addressline2,
  this.city,
  this.state,
  this.pincode,
  this.serviceArea,
  this.totalClothes,
  this.paymentMethod,
  this.totalOrderprice,
  this.orderSubtotal,
  this.isPickedUp,
  });
  final String customerName;
  final String orderId;
  final String serviceType;
  final String customerPhoneNumber;
  final String addressline1;
  final String addressline2;
  final String city;
  final String state;
  final String pincode;
  final String serviceArea;
  final String totalClothes;
  final String paymentMethod;
  final String totalOrderprice;
  final String orderSubtotal;
  final bool isPickedUp;
  @override
  _PreviousOrdersBoxState createState() => _PreviousOrdersBoxState();
}

class _PreviousOrdersBoxState extends State<PreviousOrdersBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ExpansionTile(
        title: Text(
          widget.customerName,
          style:TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
        ),
        subtitle: Text(
          'Service Type:'+
          widget.serviceType
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 50,
          ),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('Order Id:'+widget.orderId),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('Phone:'+widget.customerPhoneNumber),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('Address Line 1:'+widget.addressline1),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('Address Line 2:'+widget.addressline2),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('city:'+widget.city), 
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title:Text('state:'+widget.state),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('pincode:'+widget.pincode),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                title: Text('total clothes:'+widget.totalClothes),
                trailing: RaisedButton(
                  onPressed: (){},
                  child: Text('Clothes details'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}