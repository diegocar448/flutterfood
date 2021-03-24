import 'dart:convert';

class Evaluation {
  String nameUser;
  String comment;
  double stars;

  /* Deixando fica obrigatório passar os parâmetros */
  Evaluation({
    this.nameUser,
    this.comment,
    this.stars,
  });

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      nameUser: jsonData['nameUser'],
      comment: jsonData['comment'],
      stars: double.parse(jsonData['stars']),
    );
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode(
        {'nameUser': nameUser, 'comment': comment, 'stars': stars});
  }
}
