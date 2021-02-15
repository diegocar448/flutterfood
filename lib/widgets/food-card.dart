import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;

  /* Deixando fica obrigatório passar os parâmetros */
  FoodCard({
    this.identify,
    this.title,
    this.description,
    this.price,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
