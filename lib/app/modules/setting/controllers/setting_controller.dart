import '../../../models/user_model.dart';
import 'package:get/get.dart';
import '../../../services/app_userService.dart';

class SettingController extends GetxController {
  var userModel = UserModel().obs;
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void initUserInfo() async {
  //   List list = await DoUserService.getUserInfo();
  //   if (list.isNotEmpty) {
  //     userModel.value = UserModel.fromJson(list[0]);
  //   }
  // }

  void getUserInfo() async {
    isLogin.value = await DoUserService.isLogin();
    var data = await DoUserService.getUserInfo();
    if (data != []) {
      userModel.value = UserModel.fromJson(data[0]);
      update();
    }
  }

  ///控制器中有方法在view中执行，才会触发lazyPut的controller执行onInit等方法，
  ///否则，那怕页面一直在打开关闭也不会执行
  // void test() {
  //   print("test lazyPut and put when call");
  // }
}
