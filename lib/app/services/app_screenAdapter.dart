import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoScreenAdapter {
  //适配宽
  static w(num value) {
    return value.w;
  }

  //适配高
  static h(num value) {
    return value.h;
  }

  //适配宽高中较小一方
  static r(num value) {
    return value.r;
  }

  //适配字体
  static fs(num value) {
    return value.sp;
  }

  //屏宽
  static sw() {
    return ScreenUtil().screenWidth; //1.sw
  }

  //屏高
  static sh() {
    return ScreenUtil().screenHeight; //1.sh
  }
}
