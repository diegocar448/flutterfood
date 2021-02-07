import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;

  const RestaurantCard({this.uuid, this.name, this.image, this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name, style: TextStyle(color: Colors.black)),
    );
  }
}
