class AddressModel {
  bool? success;
  String? message;
  List<AddressItemModel>? result;

  AddressModel({this.success, this.message, this.result});

  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['result'] != null) {
      result = <AddressItemModel>[];
      json['result'].forEach((v) {
        result?.add(AddressItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressItemModel {
  String? sId;
  String? uid;
  String? name;
  String? phone;
  String? address;
  int? defaultAddress;
  int? status;
  int? addTime;

  AddressItemModel(
      {this.sId,
      this.uid,
      this.name,
      this.phone,
      this.address,
      this.defaultAddress,
      this.status,
      this.addTime});

  AddressItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    defaultAddress = json['default_address'];
    status = json['status'];
    addTime = json['add_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['uid'] = uid;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['default_address'] = defaultAddress;
    data['status'] = status;
    data['add_time'] = addTime;
    return data;
  }
}
