class Productinfo {
  String ?id;
  String ?name;
  String ?price;
  String ?image;
  String ?explanation;

  Productinfo({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.explanation,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "price" : price,
    "image" : image,
    "explanation" : explanation
  };

  static Productinfo fromJson(Map<String, dynamic> json) => Productinfo(
    id : json["id"],
    name : json["name"],
    price : json["price"],
    image : json["image"],
    explanation : json["explanation"],
  );
}