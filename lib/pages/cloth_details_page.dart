import 'package:flutter/material.dart';

class ClothDetails extends StatelessWidget {
  ClothDetails({Key key, this.clothes});
  final List<ListTile> clothes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundro'),
      ),
      body: ListView(
        children: <Widget>[
          Text('hi')
        ],
      ),
    );
  }
}