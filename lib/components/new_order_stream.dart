import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/order_box.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
class NewOrdersStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('orders').where("shopId", isEqualTo: '123').where('orderStatus',isEqualTo:"confirmed").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<NewOrderBox> orders = [];
        for (var message in messages) {
          final orderId = message.data['orderid'];
          final customerName = message.data['customerName'];
          final serviceType = message.data['serviceName'];
          final order = NewOrderBox(
            orderId: orderId,
            customerName: customerName,
            serviceType: serviceType,
          );
          orders.add(order);
        }
        return Expanded(
          child:ListView(
            reverse: false,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            children: orders.length==0?[Text('No New Orders')]:orders,
          ),
        );
      }
    );
  }
}