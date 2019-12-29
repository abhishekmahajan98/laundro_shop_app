import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/active_orders_stream.dart';

class ActiveOrders extends StatefulWidget {
  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            ActiveOrdersStream(),
          ],
        );
  }
}
