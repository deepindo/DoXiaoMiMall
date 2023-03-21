import '../services/app_sharedPreferences.dart';

String USERINFOKEY = "userInfo";

class DoUserService {
  ///存储本地的用户信息
  static setUserInfo(List<Map> userInfoList) async {
    await DoSharedPreferences.setData(USERINFOKEY, userInfoList);
  }

  ///获取本地的用户信息
  static Future<List> getUserInfo() async {
    List list = await DoSharedPreferences.getData(USERINFOKEY);
    if (list.isNotEmpty) {
      return list;
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
    List list = await DoSharedPreferences.getData(USERINFOKEY);
    if (list.isNotEmpty && list[0]["username"] != "") {
      return true;
    } else {
      return false;
    }
  }
}
