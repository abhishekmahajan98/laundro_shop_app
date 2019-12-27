import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/previous_orders_stream.dart';

class PreviousOrders extends StatefulWidget {
  @override
  _PreviousOrdersState createState() => _PreviousOrdersState();
}

class _PreviousOrdersState extends State<PreviousOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            PreviousOrdersStream(),
          ],
        ),
      ),
    );
  }
}
