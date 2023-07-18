class Orderinfo {
  String ?id;
  String ?user_id;
  String ?datetime;
  List<String>?product_id_list;

  Orderinfo({
    this.id,
    required this.user_id,
    required this.product_id_list,
    this.datetime,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "user_id" : user_id,
    "product_id_list" : product_id_list,
    "datetime" : datetime
  };

  static Orderinfo fromJson(Map<String, dynamic> json) => Orderinfo(
    id : json["id"],
    user_id: json["user_id"],
    product_id_list : json["product_id_list"],
    datetime : json["datetime"],
  );
}