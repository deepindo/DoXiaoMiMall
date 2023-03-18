import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/customerService/bindings/customer_service_binding.dart';
import '../modules/customerService/views/customer_service_view.dart';
import '../modules/goodsContent/bindings/goods_content_binding.dart';
import '../modules/goodsContent/views/goods_content_view.dart';
import '../modules/goodsList/bindings/goods_list_binding.dart';
import '../modules/goodsList/views/goods_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/officialService/bindings/official_service_binding.dart';
import '../modules/officialService/views/official_service_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: TabsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CATEGORY,
    //   page: () => const CategoryView(),
    //   binding: CategoryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SERVICE,
    //   page: () => const ServiceView(),
    //   binding: ServiceBinding(),
    // ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      // binding: CartBinding(),
    ),
    // GetPage(
    //   name: _Paths.ME,
    //   page: () => const MeView(),
    //   binding: MeBinding(),
    // ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.fadeIn, //进入搜索页面的动画特殊定义
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.GOODS_LIST,
      page: () => const GoodsListView(),
      binding: GoodsListBinding(),
    ),
    GetPage(
      name: _Paths.GOODS_CONTENT,
      page: () => const GoodsContentView(),
      binding: GoodsContentBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_SERVICE,
      page: () => const CustomerServiceView(),
      binding: CustomerServiceBinding(),
    ),
    GetPage(
      name: _Paths.OFFICIAL_SERVICE,
      page: () => const OfficialServiceView(),
      binding: OfficialServiceBinding(),
    ),
  ];
}
