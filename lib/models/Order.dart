import 'dart:convert';

import './Food.dart';
import './Evaluation.dart';

class Order {
  String identify;
  String date;
  String status;
  String table;
  double total;
  String comment;
  List<Food> foods;
  List<Evaluation> evaluations;

  /* Deixando fica obrigatório passar os parâmetros */
  Order({
    this.identify,
    this.date,
    this.status,
    this.table,
    this.total,
    this.comment,
    this.foods,
    this.evaluations,
  });

  factory Order.fromJson(jsonData) {
    /* Aqui vamos pegar e tratar o foods e o Evaluations para o formato correto a ser consumido no flutter */
    List<Food> _foodsApi = (jsonData['products'] as List)
        .map((food) => Food.fromJson(food))
        .toList();
    List<Evaluation> _evaluationsApi = (jsonData['evalutations'] as List)
        .map((evaluation) => Evaluation.fromJson(evaluation))
        .toList();

    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      table: jsonData['table'],
      total: double.parse(jsonData['total']),
      comment: jsonData['comment'],
      foods: _foodsApi,
      evaluations: _evaluationsApi,
    );
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'table': table,
      'total': total,
      'comment': comment,
      'evaluations': evaluations
    });
  }
}
