class Postinfo {
  String ?id;
  String ?text;
  String ?user_id;
  String ?Province;
  String ?district;
  List ?image_list;
  List ?comments_list;
  List ?like_list;
  String ?datetime;

  Postinfo({
    this.id,
    required this.text,
    required this.user_id,
    required this.Province,
    required this.district,
    required this.image_list,
    this.comments_list,
    this.like_list,
    this.datetime,
  });

  Map<String, dynamic> toJson() => { // kullanımı "final json = User.tojson()" şeklindedir.
    "id" : id,
    "text": text,
    "user_id" : user_id,
    "Province" : Province,
    "district" : district,
    "image_list" : image_list,
    "comments_list" :comments_list,
    "like_list" : like_list,
    "datetime" :datetime,
  };

  static Postinfo fromJson(Map<String, dynamic> json) => Postinfo(
    id : json["id"],
    text: json["text"],
    user_id : json["user_id"],
    Province : json["Province"],
    district : json["district"],
    image_list : json["image_list"],
    comments_list: json["comments_list"],
    like_list: json["like_list"],
    datetime : json["datetime"],
  );
}