import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class FoodCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;
  bool notShowIconCart;

  /* Deixando fica obrigatório passar os parâmetros */
  FoodCard({
    this.identify,
    this.title,
    this.description,
    this.price,
    this.image,
    this.notShowIconCart,
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
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                /* Listar imagem */
                _buildImageFood(),
                /* Listar preço, descrição... */
                _buildInfoFood(),
                /* precisamos passar o context por ser um StatelessWidget */
                _buildButtonCart(context),
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
        margin: EdgeInsets.only(right: 8),
        child: ClipOval(
          //child: Image.asset('assets/images/IconeFlutterFood.png')),
          /* Aqui vamos usar a lib cached_network_image */
          child: CachedNetworkImage(
            imageUrl: image != ''
                ? image
                : 'https://florinafood.gr/imgs/logos/fresh.png',
            /* placeholder: (context, url) => Container(
              height: 80,
              width: 80,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ), */
            /* errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error),
        ), */
          ),
        ));
  }

  Widget _buildInfoFood() {
    /* Listar primeiro o nome do produto, depois descrição e depois preço */
    return Expanded(
        child: Column(
      /* .start joga o texto para o inicio */
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Container(height: 4),
        Text(description,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            )),
        Container(height: 4),
        Text("R\$ $price",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            )),
      ],
    ));
  }

  Widget _buildButtonCart(context) {
    return notShowIconCart
        ? Container()
        : Container(
            child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: Icon(Icons.shopping_cart)),
          );
  }
}
