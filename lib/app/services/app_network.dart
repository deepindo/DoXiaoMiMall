import 'package:dio/dio.dart';

/// 各api的path
const String bannerPath = "api/focus/";
const String bestBannerPath = "api/focus?position=2";
const String bestCategoryPath = "api/bestCate/";
const String goodsPath = "api/plist/";
const String hotGoodsPath = "api/plist?is_hot=1&pageSize=3";
const String mainCategoryPath = "api/pcate/";
const String secondCategoryPath = "api/pcate?pid=";
// const String goodsListPath = "api/plist?page=";
//注册-发送验证码
const String sendCodePath = "api/sendCode";
//注册-验证验证码
const String validateCodePath = "api/validateCode";
//注册
const String registerPath = "api/register";
//登录
const String loginPath = "api/doLogin";
//验证码登录-发送验证码
const String sendLoginCodePath = "api/sendLoginCode";
//验证码登录-验证-注册+登录
const String validateLoginCodePath = "api/validateLoginCode";

///
///
///网络请求类
class DoNetwork {
  //根据网络环境来判断基URL是啥
  static String baseURL = "https://xiaomi.itying.com/";

  ///Dio单例
  final dio = Dio(
    BaseOptions(
      /// 连接服务器超时时间.
      connectTimeout: const Duration(milliseconds: 3000),

      /// 两次数据流数据接收的最长间隔时间，注意不是请求的最长接收时间。
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 3000),

      /// 请求基本地址，可以包含路径例如 https://dart.dev/api/。
      baseUrl: baseURL,

      /// 请求方式。
      // method: ,

      /// 请求地址的参数。
      // queryParameters:

      /// 用户自定义字段，可以在 [Interceptor]、[Transformer] 和 [Response] 中依次传递。
      // extra:

      /// HTTP 请求头。
      // headers:

      /// 期望以哪种格式（方式）接受响应数据，包括 `json`、`stream` 和 `plain`。
      ///
      /// 默认值是 `json`, 当响应头中 content-type 为 `application/json` 时，
      /// dio 会自动将响应内容转化为 json 对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `stream`。
      /// 如果想以文本（字符串）格式接收响应数据，请使用 `plain`。
      // responseType:

      /// 请求的 Content-Type。
      ///
      /// 默认值会由 [ImplyContentTypeInterceptor] 根据请求载荷类型进行推导。
      /// 可以调用 [Interceptors.removeImplyContentTypeInterceptor] 进行移除。
      ///
      /// 如果你想以 `application/x-www-form-urlencoded` 格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,
      /// [Dio] 会自动编码请求体。
      contentType: Headers.jsonContentType,

      /// `validateStatus` 决定 HTTP 响应状态码是否被视为请求成功，
      /// 返回 `true` 请求结果就会按成功处理，否则会按失败处理.
      // validateStatus:
      // receiveDataWhenStatusError:
      // followRedirects:
      // maxRedirects:
      // persistentConnection:
      // requestEncoder:
      // responseDecoder:

      /// 请求数据中数组的编码的方式，默认值为 `multiCompatible`。
      // listFormat:
    ),
  );

  /// 似乎可以再抽一个基类方法出来
  /// get请求方法
  /// api也可以抽取
  Future get(apiPath) async {
    try {
      var response = await dio.get(apiPath);
      // print("||-------------------Begin-------------------||");
      print("||----------get---->response:--$response ");
      // print("||---->response.statusCode:--${response.statusCode}");
      // print("||---->response.statusMessage:--${response.statusMessage}");
      // print("response.headers:-----${response.headers}");
      // print("response.requestOptions:-----${response.requestOptions}");

      if (response.data != null) {
        print("response.data != null");
        // print("||---->response.data:--${response.data}");
        return response.data;
      } else {
        ///应该先判断code吧，然后根据情况返回data
        print("||---->response.statusCode:--${response.statusCode}");
        print("||---->response.statusMessage:--${response.statusMessage}");
        print("||---->response.headers:--${response.headers}");
        // print("||---->response.requestOptions:--${response.requestOptions}");
        // print("||---->response.isRedirect:--${response.isRedirect}");
        // print("||---->response.extra:--${response.extra}");
        // print("||---->response.redirects:--${response.redirects}");
        return null;
      }
    } on DioError catch (e) {
      // Something happened in setting up or sending the request that triggered an Error
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      ///请求失败的，比如断网了，是不是要在这里添加网络监听
      print("---catchError:$e.message");
      return null;
    }
  }

  ///post请求
  Future post(String apiPath, {Object? data}) async {
    try {
      var response = await Dio().post(apiPath, data: data);
      print("||--------post---->response:--$response ");
      if (response.data != null) {
        print("response.data != null");
        // print("||---->response.data:--${response.data}");
        return response.data;
      } else {
        ///应该先判断code吧，然后根据情况返回data
        print("||---->response.statusCode:--${response.statusCode}");
        print("||---->response.statusMessage:--${response.statusMessage}");
        print("||---->response.headers:--${response.headers}");
        // print("||---->response.requestOptions:--${response.requestOptions}");
        // print("||---->response.isRedirect:--${response.isRedirect}");
        // print("||---->response.extra:--${response.extra}");
        // print("||---->response.redirects:--${response.redirects}");
        return null;
      }
    } on DioError catch (e) {
      // print("catchError-----:$e.error");
      // print("catchError-----:$e.response");
      print("catchError-----:$e.message");
      // print("catchError-----:$e.type");
      // print("catchError-----:$e.requestOptions");

      return null;
    }
  }

  ///替换图片链接中的"\"为"/""
  ///String类型要指定，不然可能会有问题，养成习惯
  static replacePictureURL(String path) {
    String tempURL = baseURL + path;
    return tempURL.replaceAll("\\", "/");
  }
}
