import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
class TotalPaymentsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('orders').where("shopId", isEqualTo: '123').where('orderStatus',isEqualTo:"delivered").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final orders = snapshot.data.documents;
        double sumOfOrders=0;
        for(var order in orders){
          sumOfOrders+=double.parse(order.data['totalOrderPrice'])-double.parse(order.data['orderCommission']);
          //print(sumOfOrders);
        }
        return Row(
          children: <Widget>[
            Text('₹ '+sumOfOrders.toString()),
          ],
        );
      }
    );
  }
}