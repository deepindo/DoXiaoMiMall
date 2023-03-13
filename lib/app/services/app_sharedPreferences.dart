import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DoSharedPreferences {
  ///设置
  static setData(String key, dynamic value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(key, jsonEncode(value));
  }

  ///获取
  static getData(String key) async {
    try {
      var sp = await SharedPreferences.getInstance();
      String? s = sp.getString(key);

      if (s != null) {
        return json.decode(s);
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return e.toString();
    }
  }

  ///移除某个key的所有数据
  static removeData(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  ///清空所有本地数据
  ///慎用！！！
  static clearData() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
