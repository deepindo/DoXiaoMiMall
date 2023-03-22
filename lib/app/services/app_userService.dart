import '../services/app_sharedPreferences.dart';

String USERINFOKEY = "userInfo";

class DoUserService {
  ///存储本地的用户信息
  static setUserInfo(List userInfoList) async {
    await DoSharedPreferences.setData(USERINFOKEY, userInfoList);
  }

  ///获取本地的用户信息
  static Future<List> getUserInfo() async {
    var data = await DoSharedPreferences.getData(USERINFOKEY);
    if (data != null && data.isNotEmpty) {
      return data;
    } else {
      return [];
    }
  }

  ///移除用户信息
  static removeUserInfo() async {
    await DoSharedPreferences.removeData(USERINFOKEY);
  }

  ///获取用户登录状态
  static Future<bool> isLogin() async {
    var data = await DoSharedPreferences.getData(USERINFOKEY);
    if (data != null && data.isNotEmpty && data[0]["username"] != "") {
      return true;
    } else {
      return false;
    }
  }
}
