
import 'package:get/get.dart';

import '../view/auth/forgot_password_page/forgot_password.dart';
import '../view/auth/login_page/login_page.dart';
import '../view/auth/signup_page/signup_page.dart';
import '../view/categories_screen/women_top_screen/women_brand_screen.dart';
import '../view/categories_screen/women_top_screen/wonen_category_filter/women_filter_screen.dart';
import '../view/categories_screen/women_top_screen/women_top_screen.dart';
import '../view/home/home_page/home_page.dart';
import '../view/home/reviews_ratings/ratings_reviews_page.dart';
import '../view/my_bag/my_bag_pages/add_shipping_address_page.dart';
import '../view/my_bag/my_bag_pages/my_bag_checkout_page.dart';
import '../view/my_bag/my_bag_pages/payment_methods_page.dart';
import '../view/my_bag/my_bag_pages/shipping_addresses.dart';
import '../view/my_bag/my_bag_pages/success_page.dart';
import '../view/myprofile_screen/my_order_screen/my_order_screen.dart';
import '../view/myprofile_screen/my_order_details.dart';
import '../view/myprofile_screen/my_order_setting_screen/my_order_settings_screen.dart';


class RouteName {
  static const String homePage = '/homePage';
  static const String signUpPage = '/signUpPage';
  static const String loginPage = '/loginPage';
  static const String forgotPassword = '/forgotPassword';
  static const String myBagCheckoutPage = '/myBagCheckoutPage';
  static const String paymentMethodsPage = '/paymentMethodsPage';
  static const String shippingAddresses = '/shippingAddresses';
  static const String addShippingAddress = '/addShippingAddress';
  static const String successPage = '/successPage';
  static const String womenTopScreen = '/womenTopScreen';
  static const String filterScreen = '/filterScreen';
  static const String womenBrandScreen = '/womenBrandScreen';
  static const String myOrderScreen = '/myOrderScreen';
  static const String myOrderDetails = '/myOrderDetails';
  static const String ratingsReviewsPage = '/ratingsReviewsPage';
  static const String myOrderSettingScreen = '/myOrderSettingScreen';

}

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.homePage,
      page: () => HomePage(),
    ),
    GetPage(
          name: RouteName.signUpPage,
          page: () => SignUpPage(),
        ),
    GetPage(
      name: RouteName.loginPage,
      page: () => LoginPage(),
    ),

    GetPage(
      name: RouteName.forgotPassword,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: RouteName.myBagCheckoutPage,
      page: () => MyBagCheckOutPage(),
    ),
    GetPage(
      name: RouteName.paymentMethodsPage,
      page: () => PaymentMethodsPage(),
    ),
    GetPage(
      name: RouteName.shippingAddresses,
      page: () => ShippingAddresses(),
    ),
    GetPage(
      name: RouteName.addShippingAddress,
      page: () => AddShippingAddressPage(),
    ),
    GetPage(
      name: RouteName.successPage,
      page: () => SuccessPage(),
    ),
    GetPage(
      name: RouteName.myOrderDetails,
      page: () => MyOrderDetails(),
    ),
    GetPage(
      name: RouteName.womenTopScreen,
      page: () => WomenTopScreen(),
    ),
    GetPage(
      name: RouteName.filterScreen,
      page: () => WomenFilterScreen(),
    ),
    GetPage(
      name: RouteName.womenBrandScreen,
      page: () => WomenBrandPage(),
    ),
    GetPage(
      name: RouteName.myOrderScreen,
      page: () => MyOrderScreen(),
    ),
    GetPage(
      name: RouteName.ratingsReviewsPage,
      page: () => RatingsReviewsPage(),
    ),
    GetPage(
      name: RouteName.myOrderSettingScreen,
      page: () => MyOrderSettingScreen(),
    ),

  ];
}
