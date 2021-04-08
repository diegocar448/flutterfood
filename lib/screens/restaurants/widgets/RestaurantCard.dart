import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/Restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({this.restaurant});

  @override
  Widget build(BuildContext context) {
    /* GestureDetector para quando clicar na imagem ele acessar a proxima tela */
    return GestureDetector(
      onTap: () {
        //print(restaurant.name);
        Navigator.pushNamed(context, '/foods', arguments: restaurant);
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 1, left: 1, bottom: 2),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(children: <Widget>[
                Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      //child: Image.asset('assets/images/IconeFlutterFood.png')),
                      /* Aqui vamos usar a lib cached_network_image */
                      child: CachedNetworkImage(
                        imageUrl: restaurant.image != ''
                            ? restaurant.image
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
                    )),
                VerticalDivider(color: Colors.black54),
                /* Usamos o Expanded() para 'forçar' e adicionar o texto no card*/
                Expanded(
                    child: Text(restaurant.name,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
