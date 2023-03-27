import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoScreenAdapter {
  ///适配宽
  static w(num value) {
    return value.w;
  }

  ///适配高
  static h(num value) {
    return value.h;
  }

  ///适配宽高中较小一方
  static r(num value) {
    return value.r;
  }

  ///适配字体
  static fs(num value) {
    return value.sp;
  }

  ///屏宽
  static screenW() {
    return ScreenUtil().screenWidth; //1.sw
  }

  ///屏高
  static screenH() {
    return ScreenUtil().screenHeight; //1.sh
  }

  ///状态栏高度 刘海屏会更高
  static statusH() {
    return ScreenUtil().statusBarHeight; //1.sh
  }

  ///对于导航栏(不加状态栏的高)，两端统一用这个
  ///方便控制
  static navH() {
    return 44.h; //1.sh
  }

  ///对于底部栏(不加安全区的高)，两端统一用这个
  ///方便控制
  static tabBarH() {
    return 49.h; //1.sh
  }

  ///底部安全区距离，适用于全面屏下面有按键的
  ///因为安卓手机获取的值为0，实际显示其实是和iOS-x系列以后一样，
  ///底部是个弧形的屏幕，太贴底，而且感觉按49高度设置的水平居中的控制，实际看起来的效果是偏下
  ///对于这个，在这控制更加方便
  static bottomH() {
    return ScreenUtil().bottomBarHeight != 0.0
        ? ScreenUtil().bottomBarHeight
        : 34.0; //1.sh
  }

  static adapterBottomH() {
    return tabBarH() + bottomH();
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
#define kStatusBarH             (kISIPhoneX_Serial == YES ? 44 : 20)  /// 状态栏高度, 安卓咋是33.0，iOS是47
#define kSafeAreaBottomHeight   (kISIPhoneX_Serial == YES ? 34 : 0)   /// 底部安全区高度，安卓是0.0，iOS是34

 */
