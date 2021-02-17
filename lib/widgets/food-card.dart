import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

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
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                /* Listar imagem */
                _buildImageFood(),
                /* Listar preço, descrição... */
                _buildInfoFood(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
        width: 80,
        height: 80,
        child: ClipOval(
          //child: Image.asset('assets/images/IconeFlutterFood.png')),
          /* Aqui vamos usar a lib cached_network_image */
          child: CachedNetworkImage(
            imageUrl: image != ''
                ? image
                : 'https://florinafood.gr/imgs/logos/fresh.png',
            placeholder: (context, url) => Container(
              height: 80,
              width: 80,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            /* errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error),
        ), */
          ),
        ));
  }

  Widget _buildInfoFood() {
    /* Listar primeiro o nome do produto, depois descrição e depois preço */
    return Column(
      children: [
        Text(title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Container(height: 5),
        Text(description,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            )),
        Container(height: 5),
        Text("R\$ $price",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
