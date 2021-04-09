import 'dart:convert';

class User {
  String name;
  String email;

  /* Deixando fica obrigatório passar os parâmetros */
  User({this.name, this.email});

  factory User.fromJson(jsonData) {
    return User(name: jsonData['name'], email: jsonData['email']);
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode({'name': name, 'email': email});
  }
}
