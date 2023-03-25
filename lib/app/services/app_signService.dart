import 'dart:convert';
import 'package:crypto/crypto.dart';

class DoSignService {
  ///创建并获取签名
  static String createAndGetSign(Map map) {
    ///1.获取登录成功以后返回的salt
    ///2.获取请求的所有参数

    ///3.生成一个map类型的对象
    ///4.获取map对象的所有key,按照ASCII字符顺序进行升序排列(也就是所谓的自然顺序)
    List mapKeyList = map.keys.toList();
    mapKeyList.sort();

    ///5.拼接字符串
    String str = "";
    for (var i = 0; i < mapKeyList.length; i++) {
      String key = mapKeyList[i];
      str += "$key${map[key]}";
    }

    ///6.md5加密生成签名
    String sign = md5.convert(utf8.encode(str)) as String;

    return sign;
  }
}
