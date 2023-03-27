class OrderModel {
  bool? success;
  String? message;
  List<OrderItemModel>? result;

  OrderModel({this.success, this.message, this.result});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['result'] != null) {
      result = <OrderItemModel>[];
      json['result'].forEach((v) {
        result?.add(OrderItemModel.fromJson(v));
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

class OrderItemModel {
  String? sId;
  String? uid;
  String? name;
  String? phone;
  String? address;
  String? allPrice;
  String? orderId;
  int? addTime;
  int? payStatus;
  int? orderStatus;
  List<OrderGoodsItemModel>? orderItem;

  OrderItemModel(
      {this.sId,
      this.uid,
      this.name,
      this.phone,
      this.address,
      this.allPrice,
      this.orderId,
      this.addTime,
      this.payStatus,
      this.orderStatus,
      this.orderItem});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    allPrice = json['all_price'];
    orderId = json['order_id'];
    addTime = json['add_time'];
    payStatus = json['pay_status'];
    orderStatus = json['order_status'];
    if (json['order_item'] != null) {
      orderItem = <OrderGoodsItemModel>[];
      json['order_item'].forEach((v) {
        orderItem?.add(OrderGoodsItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['uid'] = uid;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['all_price'] = allPrice;
    data['order_id'] = orderId;
    data['add_time'] = addTime;
    data['pay_status'] = payStatus;
    data['order_status'] = orderStatus;
    if (orderItem != null) {
      data['order_item'] = orderItem?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderGoodsItemModel {
  String? sId;
  String? orderId;
  String? productTitle;
  String? productId;
  int? productPrice;
  String? productImg;
  int? productCount;
  String? selectedAttr;
  int? addTime;

  OrderGoodsItemModel(
      {this.sId,
      this.orderId,
      this.productTitle,
      this.productId,
      this.productPrice,
      this.productImg,
      this.productCount,
      this.selectedAttr,
      this.addTime});

  OrderGoodsItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['order_id'];
    productTitle = json['product_title'];
    productId = json['product_id'];
    productPrice = json['product_price'];
    productImg = json['product_img'];
    productCount = json['product_count'];
    selectedAttr = json['selected_attr'];
    addTime = json['add_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['order_id'] = orderId;
    data['product_title'] = productTitle;
    data['product_id'] = productId;
    data['product_price'] = productPrice;
    data['product_img'] = productImg;
    data['product_count'] = productCount;
    data['selected_attr'] = selectedAttr;
    data['add_time'] = addTime;
    return data;
  }
}
