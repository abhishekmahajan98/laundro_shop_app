import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/models/user_model.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class TotalPaymentsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('orders')
          .where("shopId", isEqualTo: User.uid)
          .where('orderStatus', isEqualTo: "delivered")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainColor,
                ),
              ),
            ],
          );
        }
        final orders = snapshot.data.documents;
        double sumOfOrders = 0;
        for (var order in orders) {
          sumOfOrders += double.parse(order.data['totalOrderPrice']);
        }
        return Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
            decoration: BoxDecoration(
              color: mainColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Lifetime Earning',
                      style: kLargeBlackTextStyle,
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  '₹ ' + sumOfOrders.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
