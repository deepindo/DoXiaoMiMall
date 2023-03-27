import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxList payToolsList = [
    {
      "id": 0,
      "title": "小米钱包",
      "subTitle": "捷付睿通股份有限公司",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 1,
      "title": "微信支付",
      "subTitle": "捷付睿通股份有限公司1",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 2,
      "title": "支付宝支付",
      "subTitle": "捷付睿通股份有限公司2",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 3,
      "title": "云闪付",
      "subTitle": "捷付睿通股份有限公司3",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 4,
      "title": "翼支付",
      "subTitle": "捷付睿通股份有限公司4",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ].obs;

  RxList creditProductsList = [
    {
      "id": 0,
      "title": "信用卡分期",
      "subTitle": "捷付睿通股份有限公司",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 1,
      "title": "小米分期",
      "subTitle": "捷付睿通股份有限公司",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 2,
      "title": "白条分期",
      "subTitle": "捷付睿通股份有限公司",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
    {
      "id": 3,
      "title": "花呗分期",
      "subTitle": "捷付睿通股份有限公司",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    },
  ].obs;

  RxInt selectedPaymentToolIndex = (-1).obs;
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
