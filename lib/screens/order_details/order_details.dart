import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';
import '../../widgets/food-card.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order;

  @override
  Widget build(BuildContext context) {
    /* Aqui pegamos os dados da outra screen order_page.dart */
    RouteSettings settings = ModalRoute.of(context).settings;
    _order = settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Pedido"), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(child: _buildOrderDetails(context)),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeTextOrder("Numero", _order.identify),
          _makeTextOrder("Data", _order.date),
          _makeTextOrder("Status", _order.status),
          _makeTextOrder("Total", _order.total.toString()),
          _order.comment != null
              ? _makeTextOrder("Comentário", _order.comment)
              : Container(),
          Container(height: 30),
          Text("Comidas",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          _buildFoodsOrder(),
          Container(height: 30),
          Text("Avaliações",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Text(textLabel + ': ',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(textValue,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ));
  }

  Widget _buildFoodsOrder() {
    return Container(
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _order.foods.length,
            itemBuilder: (context, index) {
              final Food food = _order.foods[index];
              return FoodCard(
                food: food,
                notShowIconCart: true,
              );
            }));
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluations.length > 0
        ? Container(
            padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _order.evaluations.length,
                itemBuilder: (context, index) {
                  final Evaluation evalution = _order.evaluations[index];
                  return _buildEvalutionItem(evalution, context);
                }),
          )
        : Container(
            height: 40,
            margin: EdgeInsets.only(bottom: 30, top: 10),
            child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/evaluation-order",
                    arguments: _order.identify,
                  );
                },
                color: Colors.orange,
                elevation: 2.2,
                child: Text("Avaliar o Pedido"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.orangeAccent))));
  }

  Widget _buildEvalutionItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RatingBar.builder(
              initialRating: evaluation.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
            Row(
              children: [
                Text(
                  "${evaluation.user.name} - ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${evaluation.comment} - ",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
