class GoodsContentModel {
  ///在这里写一下命令转模型与网站转模型的区别
  ///
  // GoodsContentModel({required this.result,});
  // late final GoodsContentInfoModel result;
  ///下面是命令转的，在_data命名上喜欢加_私有化，
  ///id这种关键字字段不会主动转义改名,对result及各模型字段的修饰添加了late final
  ///
  GoodsContentInfoModel? result;

  GoodsContentModel({this.result});

  GoodsContentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? GoodsContentInfoModel?.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class GoodsContentInfoModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  int? status;
  String? pic;
  String? content;
  String? cname;
  List<Attr>? attr;
  String? subTitle;
  int? salecount;
  String? specs;

  GoodsContentInfoModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.status,
      this.pic,
      this.content,
      this.cname,
      this.attr,
      this.subTitle,
      this.salecount,
      this.specs});

  GoodsContentInfoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = <Attr>[];
      json['attr'].forEach((v) {
        attr?.add(Attr.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'];
    specs = json['specs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['cname'] = cname;
    if (attr != null) {
      data['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    data['sub_title'] = subTitle;
    data['salecount'] = salecount;
    data['specs'] = specs;
    return data;
  }
}

class Attr {
  String? cate;
  List<String>? list;

  Attr({this.cate, this.list});

  Attr.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    return data;
  }
}
