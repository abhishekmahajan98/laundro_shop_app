import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _firestore = Firestore.instance;
class ActiveOrdersBox extends StatefulWidget {
  ActiveOrdersBox({this.orderId,
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
  _ActiveOrdersBoxState createState() => _ActiveOrdersBoxState();
}

class _ActiveOrdersBoxState extends State<ActiveOrdersBox> {
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
              ListTile(
                leading: RaisedButton(
                  onPressed: () async{
                    final document =await _firestore.collection('orders').document(widget.orderId).get();
                    if(document['isPickedUp']==true){
                      Alert(
                      context: context,
                      title: 'Order has already been picked up!!',
                      buttons: [
                        DialogButton(
                          child: Text('Okay'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ]).show();
                    }
                    else{
                      _firestore
                      .collection('orders')
                      .document(widget.orderId)
                      .updateData({
                        'isPickedUp':true,
                      });
                      Alert(
                        context: context,
                        title: 'Order picked up!!',
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
                  child: Text('Pick Up'),
                ),
                title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RaisedButton(
                    onPressed: () async{
                      final document =await _firestore.collection('orders').document(widget.orderId).get();
                      if(document['isPickedUp']==true){
                        _firestore
                        .collection('orders')
                        .document(widget.orderId)
                        .updateData({
                          'orderStatus':'delivered',
                        });
                      }
                      else{
                        Alert(
                          context: context,
                          title: 'Order has not been picked up yet!',
                          desc:
                              'Please pick up the order first by asking for the otp from the customer. If you have picked up the order already and updated the order in the application, please raise an issue using the button beside delivered button',
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
                    child: Text('Delivered'),
                  ),
                ),
                trailing: RaisedButton(
                  onPressed: (){},
                  child: Text('Raise Issue'),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}