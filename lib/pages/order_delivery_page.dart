import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/order_delivery_stream.dart';

class OrderDeliveryPage extends StatefulWidget {
  @override
  _OrderDeliveryPageState createState() => _OrderDeliveryPageState();
}

class _OrderDeliveryPageState extends State<OrderDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OrderDeliveryStream(),
      ],
    );
  }
}
