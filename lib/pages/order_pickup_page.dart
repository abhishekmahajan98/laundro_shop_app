import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/order_pickup_stream.dart';

class OrderPickupPage extends StatefulWidget {
  @override
  _OrderPickupPageState createState() => _OrderPickupPageState();
}

class _OrderPickupPageState extends State<OrderPickupPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OrderPickupStream(),
      ],
    );
  }
}
