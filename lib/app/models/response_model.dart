class ResponseModel {
  bool success;
  String message;

  ResponseModel({required this.success, required this.message});

  // BannerItemModel.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   title = json['title'];
  //   status = json['status'];
  //   pic = json['pic'];
  //   url = json['url'];
  //   position = json['position'];
  // }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['_id'] = sId;
  //   data['title'] = title;
  //   data['status'] = status;
  //   data['pic'] = pic;
  //   data['url'] = url;
  //   data['position'] = position;
  //   return data;
  // }
}
