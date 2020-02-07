import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/previous_orders_box.dart';
import 'package:laundro_shop_app/models/user_model.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class PreviousOrdersStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('orders')
            .where("shopId", isEqualTo: User.uid)
            .where('orderStatus', isEqualTo: "delivered")
            .orderBy('orderTimestamp')
            .limit(30)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data.documents;
          List<PreviousOrdersBox> orders = [];
          for (var message in messages) {
            final orderId = message.data['orderid'];
            final customerName = message.data['customerName'];
            final serviceType = message.data['serviceName'];
            final customerPhoneNumber = message.data['customerPhoneNumber'];
            final primaryAddress = message.data['primaryAddress'];
            final landmark = message.data['landmark'];
            final placeName = message.data['placeName'];
            final locality = message.data['locality'];
            final administrativeArea = message.data['administrativeArea'];
            final pincode = message.data['pincode'];
            final GeoPoint geoLocation = message.data['geoLocation'];
            final serviceArea = message.data['serviceArea'];
            final totalClothes = message.data['totalClothes'];
            final paymentMethod = message.data['paymentMethod'];
            final totalOrderprice = message.data['totalOrderPrice'];
            final orderSubtotal = message.data['orderSubtotal'];
            final isPickedUp = message.data['isPickedUp'];
            final clothList = message.data['clothList'];
            final PreviousOrdersBox order = PreviousOrdersBox(
              orderId: orderId,
              customerName: customerName,
              serviceType: serviceType,
              customerPhoneNumber: customerPhoneNumber,
              placeName: placeName,
              locality: locality,
              administrativeArea: administrativeArea,
              pincode: pincode,
              primaryAddress: primaryAddress,
              landmark: landmark,
              geoLocation: geoLocation,
              serviceArea: serviceArea,
              totalClothes: totalClothes,
              paymentMethod: paymentMethod,
              totalOrderprice: totalOrderprice,
              orderSubtotal: orderSubtotal,
              isPickedUp: isPickedUp,
              clothList: clothList,
            );
            orders.add(order);
          }
          return Expanded(
            child: ListView(
              reverse: false,
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
              children:
                  orders.length == 0 ? [Text('No orders to show')] : orders,
            ),
          );
        });
  }
}
