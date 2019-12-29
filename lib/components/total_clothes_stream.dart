import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/models/user_model.dart';
import '../constants.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
class TotalClothesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('orders').where("shopId", isEqualTo: User.uid).where('orderStatus',isEqualTo:"delivered").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            ],
          );
        }
        final orders = snapshot.data.documents;
        int sumOfClothes=0;
        for(var order in orders){
          sumOfClothes+=int.parse(order.data['totalClothes']);
          //print(sumOfOrders);
        }
        return Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              //color: Color(0XFF6bacde),
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Total Clothes Serviced',
                      style: kCategoryTextStyle,
                      ),
                  ),
                ),
                Center(
                  child: Text(
                    sumOfClothes.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}