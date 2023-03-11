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

/**
 * #define kISPortrait             UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])   /// 是否是竖屏
#define kISLandscape            UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])   /// 是否是横屏
#define kISPad_Model            (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) ? YES : NO)
#define kISPhone_Model          (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? YES : NO)
#define kISIPhoneX_Serial       ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? YES : NO)

#define kSharedApplication      ([UIApplication sharedApplication])             /// 主程序
#define kSharedWindow           ([UIApplication sharedApplication].keyWindow)   /// 主window
#define kSharedDelegate         ([UIApplication sharedApplication].delegate)    /// 主delegate
#define kUserDefaults           ([NSUserDefaults standardUserDefaults])         /// 偏好设置
#define kScreenBounds           ([UIScreen mainScreen].bounds)   /// 屏幕区域
#define kScreenSize             ([UIScreen mainScreen].bounds.size)         /// 屏幕尺寸
#define kScreenWidth            (kISPortrait ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)   /// 屏幕屏宽
#define kScreenHeight           (kISPortrait ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)   /// 屏幕屏高
#define kScreenScale            (kScreenWidth / (kISPad_Model ? 810.0 : 375.0))                        /// 屏幕比例---iPad是以8代的竖屏宽来适配的
#define kUIAdapter(v)           (v*kScreenScale)              /// 尺寸适配
#define kRectAdapter(x,y,w,h)   (CGRectMake(kUIAdapter(x), kUIAdapter(y), kUIAdapter(w), kUIAdapter(h)))              /// rect适配

#define kNavBarH                (kISIPhoneX_Serial == YES ? 88 : 64)  /// 导航栏高度
#define kTabBarH                (kISIPhoneX_Serial == YES ? 83 : 49)  /// 底部Tabbar高度
#define kStatusBarH             (kISIPhoneX_Serial == YES ? 44 : 20)  /// 状态栏高度
#define kSafeAreaBottomHeight   (kISIPhoneX_Serial == YES ? 34 : 0)   /// 底部安全区高度

 */