import 'package:get/get.dart';

import '../modules/address/addressCreate/bindings/address_create_binding.dart';
import '../modules/address/addressCreate/views/address_create_view.dart';
import '../modules/address/addressManager/bindings/address_manager_binding.dart';
import '../modules/address/addressManager/views/address_manager_view.dart';
import '../modules/address/addressModify/bindings/address_modify_binding.dart';
import '../modules/address/addressModify/views/address_modify_view.dart';
import '../modules/afterSale/bindings/after_sale_binding.dart';
import '../modules/afterSale/views/after_sale_view.dart';
import '../modules/auth/accountHelp/bindings/account_help_binding.dart';
import '../modules/auth/accountHelp/views/account_help_view.dart';
import '../modules/auth/accountPasswordLogin/bindings/account_password_login_binding.dart';
import '../modules/auth/accountPasswordLogin/views/account_password_login_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/oneClickLogin/bindings/one_click_login_binding.dart';
import '../modules/auth/oneClickLogin/views/one_click_login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/registerCode/bindings/register_code_binding.dart';
import '../modules/auth/registerCode/views/register_code_view.dart';
import '../modules/auth/registerPassword/bindings/register_password_binding.dart';
import '../modules/auth/registerPassword/views/register_password_view.dart';
import '../modules/auth/resetPassword/bindings/reset_password_binding.dart';
import '../modules/auth/resetPassword/views/reset_password_view.dart';
import '../modules/auth/verificationCode/bindings/verification_code_binding.dart';
import '../modules/auth/verificationCode/views/verification_code_view.dart';
import '../modules/auth/verificationCodeLogin/bindings/verification_code_login_binding.dart';
import '../modules/auth/verificationCodeLogin/views/verification_code_login_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/customerService/bindings/customer_service_binding.dart';
import '../modules/customerService/views/customer_service_view.dart';
import '../modules/goodsContent/bindings/goods_content_binding.dart';
import '../modules/goodsContent/views/goods_content_view.dart';
import '../modules/goodsList/bindings/goods_list_binding.dart';
import '../modules/goodsList/views/goods_list_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/messageNotification/bindings/message_notification_binding.dart';
import '../modules/messageNotification/views/message_notification_view.dart';
import '../modules/officialService/bindings/official_service_binding.dart';
import '../modules/officialService/views/official_service_view.dart';
import '../modules/orderContent/bindings/order_content_binding.dart';
import '../modules/orderContent/views/order_content_view.dart';
import '../modules/orderList/bindings/order_list_binding.dart';
import '../modules/orderList/views/order_list_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/personalHomepage/bindings/personal_homepage_binding.dart';
import '../modules/personalHomepage/views/personal_homepage_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/vipCode/bindings/vip_code_binding.dart';
import '../modules/vipCode/views/vip_code_view.dart';
import '../modules/vipMedal/bindings/vip_medal_binding.dart';
import '../modules/vipMedal/views/vip_medal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
      transition: Transition.fadeIn, //比如从空的购物车直接跳过来，不能使用rightToLeft
      transitionDuration: const Duration(milliseconds: 100),
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
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_CODE,
      page: () => const RegisterCodeView(),
      binding: RegisterCodeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_PASSWORD,
      page: () => const RegisterPasswordView(),
      binding: RegisterPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE_LOGIN,
      page: () => const VerificationCodeLoginView(),
      binding: VerificationCodeLoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE,
      page: () => const VerificationCodeView(),
      binding: VerificationCodeBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_PASSWORD_LOGIN,
      page: () => const AccountPasswordLoginView(),
      binding: AccountPasswordLoginBinding(),
    ),
    GetPage(
      name: _Paths.ONE_CLICK_LOGIN,
      page: () => const OneClickLoginView(),
      binding: OneClickLoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_HELP,
      page: () => const AccountHelpView(),
      binding: AccountHelpBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.fadeIn, //进入搜索页面的动画特殊定义
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: _Paths.GOODS_LIST,
      page: () => const GoodsListView(),
      binding: GoodsListBinding(),
    ),
    GetPage(
      name: _Paths.GOODS_CONTENT,
      page: () => const GoodsContentView(),
      // arguments: const {"a": "a"},
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
      name: _Paths.VIP_CODE,
      page: () => const VipCodeView(),
      binding: VipCodeBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_NOTIFICATION,
      page: () => const MessageNotificationView(),
      binding: MessageNotificationBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => const MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.VIP_MEDAL,
      page: () => const VipMedalView(),
      binding: VipMedalBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_MANAGER,
      page: () => const AddressManagerView(),
      binding: AddressManagerBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_CREATE,
      page: () => const AddressCreateView(),
      binding: AddressCreateBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_MODIFY,
      // page: () => const AddressModifyView(),
      page: () => AddressModifyView(),
      binding: AddressModifyBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_HOMEPAGE,
      page: () => const PersonalHomepageView(),
      binding: PersonalHomepageBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_LIST,
      page: () => const OrderListView(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_CONTENT,
      page: () => const OrderContentView(),
      binding: OrderContentBinding(),
    ),
    GetPage(
      name: _Paths.AFTER_SALE,
      page: () => const AfterSaleView(),
      binding: AfterSaleBinding(),
    ),
  ];
}
