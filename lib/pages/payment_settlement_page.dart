import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/components/payment_box.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/models/user_model.dart';

final _firestore = Firestore.instance;

class PaymentSettlementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Payment Settlement'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection('orders')
            .where("shopId", isEqualTo: User.uid)
            .where('commissionSettled', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final documents = snapshot.data.documents;
          List<PaymentBox> outstandingSettlements = [];
          double totalCommisionLeft = 0;
          for (var doc in documents) {
            final String serviceName = doc.data['serviceName'];
            final DateTime orderTimestamp = doc.data['orderTimestamp'].toDate();
            final String orderCommission = doc.data['orderCommission'];
            final String orderid = doc.data['orderid'];
            totalCommisionLeft += double.parse(orderCommission);
            outstandingSettlements.add(
              PaymentBox(
                serviceName: serviceName,
                orderCommission: orderCommission,
                orderTimestamp: orderTimestamp,
                orderid: orderid,
              ),
            );
          }
          return Column(
            children: <Widget>[
              Expanded(
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
                            'Settlement Left',
                            style: kLargeBlackTextStyle,
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        '₹ ' +
                            double.parse(
                                    (totalCommisionLeft).toStringAsFixed(2))
                                .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: ListView(
                  children: outstandingSettlements,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
