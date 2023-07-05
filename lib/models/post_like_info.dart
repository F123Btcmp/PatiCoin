class PostLikeinfo {
  String ?id;
  String ?post_id;
  String ?user_id;
  String ?datetime;

  PostLikeinfo({
    this.id,
    required this.post_id,
    required this.user_id,
    required this.datetime,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "post_id" : post_id,
    "user_id" : user_id,
    "datetime" : datetime,
  };

  static PostLikeinfo fromJson(Map<String, dynamic> json) => PostLikeinfo(
    id : json["id"],
    post_id : json["post_id"],
    user_id : json["user_id"],
    datetime : json["datetime"],
  );
}