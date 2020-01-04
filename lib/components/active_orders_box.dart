import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import 'package:laundro_shop_app/pages/cloth_details_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _firestore = Firestore.instance;
class ActiveOrdersBox extends StatefulWidget {
  ActiveOrdersBox({this.orderId,
  @required this.customerName,
  @required this.serviceType,
  @required this.customerPhoneNumber,
  @required this.addressline1,
  @required this.addressline2,
  @required this.city,
  @required this.state,
  @required this.pincode,
  @required this.serviceArea,
  @required this.totalClothes,
  @required this.paymentMethod,
  @required this.totalOrderprice,
  @required this.orderSubtotal,
  @required this.isPickedUp,
  @required this.deliveryOtp,
  @required this.pickupOtp,
  @required this.clothList,
  @required this.orderTimestamp,
  @required this.customerUid,
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
  final String deliveryOtp;
  final String pickupOtp;
  final String customerUid;
  final DateTime orderTimestamp;
  final Map<dynamic,dynamic> clothList;
  final bool isPickedUp;
  @override
  _ActiveOrdersBoxState createState() => _ActiveOrdersBoxState();
}

class _ActiveOrdersBoxState extends State<ActiveOrdersBox> {
  String deliveryOtpEntered='';
  String pickupOtpEntered='';
  String issueEntered='';
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
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Order Id:'+widget.orderId,
                  style: kOrderCardTextStyle,
                  ),
                Text(
                  'Phone:'+widget.customerPhoneNumber,
                  style: kOrderCardTextStyle,
                 ),
                Text(
                  'Address Line 1:'+widget.addressline1,
                  style: kOrderCardTextStyle,
                  ),
                Text(
                  'Address Line 2:'+widget.addressline2,
                  style: kOrderCardTextStyle,
                  ),
                Text(
                  'city:'+widget.city,
                  style: kOrderCardTextStyle,
                  ),
                Text(
                  'state:'+widget.state,
                  style: kOrderCardTextStyle,),
                Text(
                  'pincode:'+widget.pincode,
                  style: kOrderCardTextStyle,),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('total clothes:'+widget.totalClothes),
                      RaisedButton(
                        color: Color(0XFF6bacde),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ClothDetails(clothList: widget.clothList,)),
                          );
                        },
                        child: Text('Clothes details'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: RaisedButton(
                    color: Color(0XFF6bacde),
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
                        Alert(
                        context: context,
                        title: 'Enter the OTP',
                        content: ListTile(
                          leading: Text('OTP'),
                          title: TextField(
                            maxLength: 4,
                            textAlign: TextAlign.center,
                            style: kBlackLabelStyle,
                            onChanged: (value){
                              pickupOtpEntered=value;
                            },
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            child: Text('Okay'),
                            onPressed: () {
                              if(pickupOtpEntered==widget.pickupOtp){
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
                                        Navigator.pop(context);
                                      },
                                    ),
                                ]).show();
                              }
                              else{
                                Alert(
                                  context: context,
                                  title: 'Wrong OTP',
                                  desc: 'Please enter the OTP told by the customer.',
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
                          DialogButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ]).show();
                        
                      }
                    },
                    child: Text(
                      'Pick Up',
                      ),
                  ),
                  title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: RaisedButton(
                      color: Color(0XFF6bacde),
                      onPressed: () async{
                        final document =await _firestore.collection('orders').document(widget.orderId).get();
                        if(document['isPickedUp']==true){
                          Alert(
                            context: context,
                            title: 'Please enter the delivery OTP',
                            content: ListTile(
                              leading: Text('OTP:'),
                              title: TextField(
                                maxLength: 4,
                                textAlign: TextAlign.center,
                                style: kBlackLabelStyle,
                                onChanged: (value){
                                  deliveryOtpEntered=value;
                                },
                              ),
                            ),
                            buttons: [
                              DialogButton(
                                onPressed: (){
                                  if(deliveryOtpEntered==widget.deliveryOtp){
                                    Alert(
                                      context: context,
                                      title: 'Order has been delivered!!',
                                      buttons: [
                                        DialogButton(
                                          child: Text('Okay'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _firestore
                                            .collection('orders')
                                            .document(widget.orderId)
                                            .updateData({
                                              'orderStatus':'delivered',
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                    ]).show();
                                  }
                                  else{
                                    Alert(
                                      context: context,
                                      title: 'Wrong OTP.',
                                      buttons: [
                                        DialogButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Okay'),
                                        ),
                                      ]
                                    ).show();
                                  }
                                },
                                child: Text('Okay'),
                              ),
                              DialogButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              )
                            ]
                          ).show();
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
                    color: Colors.redAccent,
                    onPressed: (){
                      Alert(
                        context: context,
                        title: 'What\'s wrong?',
                        desc: 'Describe us the issue below. We will get back to you ASAP.',
                        content: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.info,
                          ),
                          title: TextField(
                            style: kBlackLabelStyle,
                            onChanged: (value){
                              issueEntered=value;
                            },
                          ), 
                        ),
                      buttons: [
                        DialogButton(
                          child: Text('Send'),
                          onPressed: () {
                            if(issueEntered!=null && issueEntered.length>1){
                              _firestore.collection('orderIssues').document().setData({
                                'orderTimestamp': widget.orderTimestamp,
                                'issueTimestamp': DateTime.now(),
                                'customerId':widget.customerUid,
                                'issueDescription': issueEntered,
                                'customerPhoneNumber': widget.customerName,
                                'shopPhonenumber':User.phone,
                                'customerName':widget.customerName,
                                'customerPhoneNumber':widget.customerPhoneNumber,
                                'orderId':widget.orderId,
                              });
                              Navigator.pop(context);
                            }
                            else{
                              Alert(
                                context: context,
                                title: 'Please enter the issue',
                                buttons: [
                                  DialogButton(
                                    child:Text('Okay'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]
                              );
                            }
                          },
                        ),
                        DialogButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                      ]
                      ).show();
                    },
                    child: Text('Raise Issue'),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}