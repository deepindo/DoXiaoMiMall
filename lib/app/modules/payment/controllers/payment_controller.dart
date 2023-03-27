import 'package:get/get.dart';

class PaymentController extends GetxController {
  String orderId = Get.arguments["orderId"];
  String orderPrice = Get.arguments["orderPrice"];
  RxList payToolsList = [
    {
      "id": 0,
      "title": "小米钱包",
      "subTitle": "捷付睿通股份有限公司",
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 1,
      "title": "微信支付",
      "subTitle": "捷付睿通股份有限公司1",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 2,
      "title": "支付宝支付",
      "subTitle": "捷付睿通股份有限公司2",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 3,
      "title": "云闪付",
      "subTitle": "捷付睿通股份有限公司3",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 4,
      "title": "翼支付",
      "subTitle": "捷付睿通股份有限公司4",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ].obs;

  RxList creditProductsList = [
    {
      "id": 0,
      "title": "信用卡分期",
      "subTitle": "捷付睿通股份有限公司",
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 1,
      "title": "小米分期",
      "subTitle": "捷付睿通股份有限公司",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 2,
      "title": "白条分期",
      "subTitle": "捷付睿通股份有限公司",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 3,
      "title": "花呗分期",
      "subTitle": "捷付睿通股份有限公司",
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
  ].obs;

  ///默认有选中第二项，必选项，所以设置了1
  RxInt selectedPaymentToolIndex = 1.obs;

  ///默认没有选中，可选项，所以设置了-1
  RxInt selectedCreditProductIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///选择支付工具
  void changePaymentToolIndex(int selectedIndex) {
    selectedPaymentToolIndex.value = selectedIndex;
    update();
  }

  ///选择信货产品
  void changeCreditProductIndex(int selectedIndex) {
    selectedCreditProductIndex.value = selectedIndex;
    update();
  }
}
