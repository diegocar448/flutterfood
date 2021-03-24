import 'dart:convert';

class Food {
  String identify;
  String title;
  String description;
  String price;
  String image;

  /* Deixando fica obrigatório passar os parâmetros */
  Food({
    this.identify,
    this.title,
    this.description,
    this.price,
    this.image,
  });

  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'].toString(),
      image: jsonData['image'],
    );
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'price': price,
      'image': image
    });
  }
}
