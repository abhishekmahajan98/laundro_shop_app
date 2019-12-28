import 'package:flutter/material.dart';

class ClothDetails extends StatefulWidget {
  ClothDetails({Key key, this.clothList});
  final Map<dynamic,dynamic> clothList;

  @override
  _ClothDetailsState createState() => _ClothDetailsState();
}

class _ClothDetailsState extends State<ClothDetails> {
  List<ListTile> clothes=[];
  void getClothesList(){
    widget.clothList.forEach((k,v){
      final ListTile lt=ListTile(
        leading: Text(k.toString()),
        trailing: Text(v.toString()),
      );
      clothes.add(lt);
    });
  }
  @override
  void initState() {
    super.initState();
    getClothesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundro'),
      ),
      body: ListView(
        children: clothes,
      ),
    );
  }
}