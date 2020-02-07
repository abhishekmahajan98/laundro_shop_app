import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/order_delivery_box.dart';
import 'package:laundro_shop_app/models/user_model.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class OrderDeliveryStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('orders')
          .where("shopId", isEqualTo: User.uid)
          .where('orderStatus', isEqualTo: "accepted")
          .where('isPickedUp', isEqualTo: true)
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
        List<OrderDeliveryBox> orders = [];
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
          final totalClothes = message.data['totalClothes'];
          final paymentMethod = message.data['paymentMethod'];
          final totalOrderprice = message.data['totalOrderPrice'];
          final orderSubtotal = message.data['orderSubtotal'];
          final isPickedUp = message.data['isPickedUp'];
          final pickupOtp = message.data['pickupOtp'];
          final deliveryOtp = message.data['deliveryOtp'];
          final clothList = message.data['clothList'];
          final timestamp = message.data['orderTimestamp'];
          final customerUid = message.data['customerUid'];
          final totalOrderPrice = message.data['totalOrderPrice'];
          final DateTime orderTimestamp = timestamp.toDate();
          final OrderDeliveryBox order = OrderDeliveryBox(
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
            totalClothes: totalClothes,
            paymentMethod: paymentMethod,
            totalOrderprice: totalOrderprice,
            orderSubtotal: orderSubtotal,
            isPickedUp: isPickedUp,
            clothList: clothList,
            pickupOtp: pickupOtp,
            deliveryOtp: deliveryOtp,
            orderTimestamp: orderTimestamp,
            customerUid: customerUid,
            totalOrderPrice: totalOrderPrice,
          );
          orders.add(order);
        }
        return Expanded(
          child: ListView(
            reverse: false,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            children: orders.length == 0 ? [Text('No New Orders')] : orders,
          ),
        );
      },
    );
  }
}
