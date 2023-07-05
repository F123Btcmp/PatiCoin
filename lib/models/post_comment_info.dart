class PostCommentinfo {
  String ?id;
  String ?text;
  String ?post_id;
  String ?user_id;
  String ?datetime;

  PostCommentinfo({
    this.id,
    required this.text,
    required this.post_id,
    required this.user_id,
    required this.datetime,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "text" : text,
    "post_id" : post_id,
    "user_id" : user_id,
    "datetime" : datetime,
  };

  static PostCommentinfo fromJson(Map<String, dynamic> json) => PostCommentinfo(
    id : json["id"],
    post_id : json["post_id"],
    user_id : json["user_id"],
    datetime : json["datetime"],
    text : json["text"],
  );
}