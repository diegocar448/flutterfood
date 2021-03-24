import 'dart:convert';

class Restaurant {
  String uuid;
  String name;
  String image;
  String contact;

  /* Deixando fica obrigatório passar os parâmetros */
  Restaurant({
    this.uuid,
    this.name,
    this.image,
    this.contact,
  });

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
        uuid: jsonData['uuid'],
        name: jsonData['name'],
        image: jsonData['image'],
        contact: jsonData['contact']);
  }

  /* Aqui vamos pegar o objeto e retornar um JSON */
  toJson() {
    return jsonEncode(
        {'uuid': uuid, 'name': name, 'image': image, 'contact': contact});
  }
}
