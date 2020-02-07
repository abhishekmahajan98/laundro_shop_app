import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundro_shop_app/constants.dart';
import 'package:laundro_shop_app/pages/cloth_details_page.dart';

class PreviousOrdersBox extends StatefulWidget {
  PreviousOrdersBox({
    this.orderId,
    @required this.customerName,
    @required this.serviceType,
    @required this.customerPhoneNumber,
    @required this.placeName,
    @required this.locality,
    @required this.administrativeArea,
    @required this.pincode,
    @required this.primaryAddress,
    @required this.landmark,
    @required this.geoLocation,
    @required this.serviceArea,
    @required this.totalClothes,
    @required this.paymentMethod,
    @required this.totalOrderprice,
    @required this.orderSubtotal,
    @required this.isPickedUp,
    @required this.clothList,
  });
  final String customerName;
  final String orderId;
  final String serviceType;
  final String customerPhoneNumber;
  final String pincode;
  final String primaryAddress;
  final String placeName;
  final String locality;
  final String administrativeArea;
  final String landmark;
  final GeoPoint geoLocation;
  final String serviceArea;
  final String totalClothes;
  final String paymentMethod;
  final String totalOrderprice;
  final String orderSubtotal;
  final bool isPickedUp;
  final Map<dynamic, dynamic> clothList;

  @override
  _PreviousOrdersBoxState createState() => _PreviousOrdersBoxState();
}

class _PreviousOrdersBoxState extends State<PreviousOrdersBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ExpansionTile(
        title: Text(widget.customerName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        subtitle: Text('Service Type:' + widget.serviceType),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 50,
          ),
        ),
        children: <Widget>[
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Order Id:' + widget.orderId,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Phone:' + widget.customerPhoneNumber,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Address:' + widget.primaryAddress,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Landmark:' + widget.landmark,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Place Name:' + widget.placeName,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Locality:' + widget.locality,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'Administrative Area:' + widget.administrativeArea,
                  style: kOrderCardTextStyle,
                ),
                Text(
                  'pincode:' + widget.pincode,
                  style: kOrderCardTextStyle,
                ),
                ListTile(
                  leading: Text(
                    'Order Total:₹ ' + widget.totalOrderprice,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                  ),
                  trailing: Text(
                    'Payment Mode:' + widget.paymentMethod,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  title: Text('total clothes:' + widget.totalClothes),
                  trailing: RaisedButton(
                    color: mainColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClothDetails(
                            clothList: widget.clothList,
                          ),
                        ),
                      );
                    },
                    child: Text('Clothes details'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
