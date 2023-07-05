class Orderinfo {
  String ?id;
  String ?amount;
  String ?product_id;

  Orderinfo({
    this.id,
    required this.product_id,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "amount" : amount,
    "product_id" : product_id,
  };

  static Orderinfo fromJson(Map<String, dynamic> json) => Orderinfo(
    id : json["id"],
    amount : json["amount"],
    product_id : json["product_id"],
  );
}