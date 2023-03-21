class UserModel {
  String? sId; //用户 id
  String? username; //用户名
  String? tel; //手机号
  String? password;
  String? salt; //用户唯一编码
  int? gold; //米金
  int? coupon; //优惠券
  int? redPacket; //红包
  int? quota; //贷款额度-单位万
  int? collect; //收藏
  int? footmark; //足迹
  int? follow; //关注

  UserModel(
      {this.sId,
      this.username,
      this.tel,
      this.password,
      this.salt,
      this.gold,
      this.coupon,
      this.redPacket,
      this.quota,
      this.collect,
      this.footmark,
      this.follow});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    tel = json['tel'];
    password = json['password'];
    salt = json['salt'];
    gold = json['gold'];
    coupon = json['coupon'];
    redPacket = json['redPacket'];
    quota = json['quota'];
    collect = json['collect'];
    footmark = json['footmark'];
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['tel'] = tel;
    data['password'] = password;
    data['salt'] = salt;
    data['gold'] = gold;
    data['coupon'] = coupon;
    data['redPacket'] = redPacket;
    data['quota'] = quota;
    data['collect'] = collect;
    data['footmark'] = footmark;
    data['follow'] = follow;
    return data;
  }
}
