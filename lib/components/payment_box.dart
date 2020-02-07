import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';

class PaymentBox extends StatelessWidget {
  PaymentBox({
    @required this.serviceName,
    @required this.orderCommission,
    @required this.orderTimestamp,
    @required this.orderid,
  });
  final String serviceName;
  final DateTime orderTimestamp;
  final String orderCommission;
  final String orderid;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: mainColor,
        child: Text(
          serviceName == 'Dry Cleaning'
              ? 'DC'
              : serviceName == 'Ironing' ? 'I' : 'W',
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        'Order Commission: ₹ ' + orderCommission,
      ),
      subtitle: Text('order id:' +
          orderid +
          '\n' +
          'order Date:' +
          orderTimestamp.day.toString() +
          '/' +
          orderTimestamp.month.toString() +
          '/' +
          orderTimestamp.year.toString()),
    );
  }
}
