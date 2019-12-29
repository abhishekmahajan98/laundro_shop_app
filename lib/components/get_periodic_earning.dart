

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundro_shop_app/models/user_model.dart';

Future<double> getEarningBetween(DateTime startDate,DateTime endDate) async{
  final _firestore = Firestore.instance;
  QuerySnapshot querySnapshot= await _firestore.collection('orders').where('shopId',isEqualTo: User.uid).where('orderStatus',isEqualTo: 'delivered').where('orderTimestamp',isGreaterThan: startDate).where('orderTimestamp',isLessThan: endDate).getDocuments();
  final result = querySnapshot.documents;
  double sumOfEarningsBetweenDates=0;
  for(var document in result){
    sumOfEarningsBetweenDates+=double.parse(document.data['totalOrderPrice'])-double.parse(document.data['orderCommission']);
  }
  
  return sumOfEarningsBetweenDates;
}