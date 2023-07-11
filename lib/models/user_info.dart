class Userinfo {
  String ?id;
  String ?name;
  String ?surname;
  String ?email;
  int ?coin;
  int ?donate;
  bool ?isactive;
  String ?picture;
  String ?phone;
  String ? join_us_datetime;
  List ? rewards_list;
  List ? busket_list;
  List ? dm_list;
  List ? follow_list;
  List ? followers_list;
  List ? post_list;
  List ? advert_list;

  Userinfo({
    this.id = "",
    required this.name,
    required this.surname,
    required this.email,
    this.coin ,
    this.donate,
    this.isactive,
    this.picture,
    this.phone ,
    this.join_us_datetime,
    this.rewards_list ,
    this.busket_list ,
    this.dm_list ,
    this.follow_list ,
    this.followers_list ,
    this.post_list ,
    this.advert_list,
  });

  Map<String, dynamic> toJson() => { // kullanımı "final json = User.tojson()" şeklindedir.
    "id" : id,
    "name" : name,
    "surname" :surname,
    "email" : email,
    "coin" : coin,
    "picture" : picture,
    "donate" : donate,
    "isactive" : isactive,
    "phone" : phone,
    "join_us_datetime" : join_us_datetime,
    "rewards_list" : rewards_list,
    "busket_list" : busket_list,
    "dm_list" : dm_list,
    "follow_list" : follow_list,
    "followers_list" : followers_list,
    "post_list" : post_list,
    "advert_list" :advert_list ,
  };

  static Userinfo fromJson(Map<String, dynamic> json) => Userinfo(
      id : json["id"],
      name : json["name"],
      surname : json["surname"],
      email : json["email"],
      coin : json["coin"],
      picture : json["picture"],
      donate : json["donate"],
      isactive : json["isactive"],
      phone : json["phone"],
      join_us_datetime :json["join_us_datetime"],
      rewards_list : json["rewards_list"],
      busket_list : json["busket_list"],
      dm_list : json["dm_list"],
      follow_list : json["follow_list"],
      followers_list : json["followers_list"],
      post_list : json["post_list"],
      advert_list : json["advert_list"],
  );
}