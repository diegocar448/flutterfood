import 'dart:convert';

class Category {
  String identify;
  String name;
  String description;

  /* Deixando fica obrigatório passar os parâmetros */
  Category({
    this.identify,
    this.name,
    this.description,
  });

  factory Category.fromJson(jsonData) {
    return Category(
        identify: jsonData['identify'],
        name: jsonData['name'],
        description: jsonData['description']);
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode(
        {'identify': identify, 'name': name, 'description': description});
  }
}
