import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
final _firestore = Firestore.instance;
class NewOrderBox extends StatefulWidget {
  NewOrderBox({this.orderId,this.customerName,this.serviceType});
  @required final String customerName;
  @required final String orderId;
  @required final String serviceType;

  @override
  _NewOrderBoxState createState() => _NewOrderBoxState();
}

class _NewOrderBoxState extends State<NewOrderBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border:Border.all(
              width: 1,
            )
          ),
          child: ListTile(
            isThreeLine: true,
            title: Text(widget.customerName),
            subtitle: Text(
              'order Id:'+
              widget.orderId+
              '\nService Type:'+
              widget.serviceType
            ),
            trailing: RaisedButton(
              color: Colors.green,

              onPressed: (){
                _firestore
                    .collection('orders')
                    .document(widget.orderId)
                    .updateData({
                      'orderStatus':'accepted',
                });
              },
              child: Text(
                'Accept',
                style: kLabelStyle,
                ),
            ),
          ),
        )
      ),
    );
  }
}

