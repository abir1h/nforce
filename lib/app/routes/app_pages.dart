import 'package:get/get.dart';

import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/views/activity_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../modules/business_manager/bindings/business_manager_binding.dart';
import '../modules/business_manager/views/business_manager_view.dart';
import '../modules/customer/bindings/customer_binding.dart';

import '../modules/customer/customer_work_order/bindings/customer_work_order_binding.dart';
import '../modules/customer/customer_work_order/views/customer_work_order_view.dart';
import '../modules/customer/sub_modules/customer_aboutUs/bindings/customer_about_us_binding.dart';
import '../modules/customer/sub_modules/customer_aboutUs/views/customer_about_us_view.dart';
import '../modules/customer/sub_modules/customer_faq/bindings/customer_faq_binding.dart';
import '../modules/customer/sub_modules/customer_faq/views/customer_faq_view.dart';
import '../modules/customer/sub_modules/customer_language/bindings/customer_language_binding.dart';
import '../modules/customer/sub_modules/customer_language/views/customer_language_view.dart';
import '../modules/customer/sub_modules/customer_paymentHistory/bindings/customer_payment_history_binding.dart';
import '../modules/customer/sub_modules/customer_paymentHistory/views/customer_payment_history_view.dart';
import '../modules/customer/sub_modules/customer_profile/bindings/customer_profile_binding.dart';
import '../modules/customer/sub_modules/customer_profile/views/customer_profile_view.dart';
import '../modules/customer/sub_modules/customer_terms/bindings/customer_terms_binding.dart';
import '../modules/customer/sub_modules/customer_terms/views/customer_terms_view.dart';
import '../modules/customer/views/customer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/line_item/bindings/line_item_binding.dart';
import '../modules/line_item/views/line_item_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/new_orders/bindings/new_orders_binding.dart';
import '../modules/new_orders/views/new_orders_view.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/service_center/bindings/service_center_binding.dart';
import '../modules/service_center/sub_modules/calendar/bindings/calendar_binding.dart';
import '../modules/service_center/sub_modules/calendar/views/calendar_view.dart';
import '../modules/service_center/sub_modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/service_center/sub_modules/dashboard/views/dashboard_view.dart';
import '../modules/service_center/sub_modules/estimation/bindings/estimation_binding.dart';
import '../modules/service_center/sub_modules/estimation/views/estimation_view.dart';
import '../modules/service_center/sub_modules/service_center_maps/bindings/service_center_maps_binding.dart';
import '../modules/service_center/sub_modules/service_center_maps/views/service_center_maps_view.dart';
import '../modules/service_center/sub_modules/work_order/bindings/work_order_binding.dart';
import '../modules/service_center/sub_modules/work_order/views/work_order_view.dart';
import '../modules/service_center/sub_modules/work_order_search/bindings/work_order_search_binding.dart';
import '../modules/service_center/sub_modules/work_order_search/views/work_order_search_view.dart';
import '../modules/service_center/sub_modules/work_order_view/bindings/work_order_view_binding.dart';
import '../modules/service_center/sub_modules/work_order_view/sub_modules/invoice/bindings/invoice_binding.dart';
import '../modules/service_center/sub_modules/work_order_view/sub_modules/invoice/views/invoice_view.dart';
import '../modules/service_center/sub_modules/work_order_view/sub_modules/over_view/bindings/over_view_binding.dart';
import '../modules/service_center/sub_modules/work_order_view/sub_modules/over_view/views/over_view.dart';
import '../modules/service_center/sub_modules/work_order_view/views/work_order_view.dart';
import '../modules/service_center/views/service_center_view.dart';
import '../modules/service_items/bindings/service_items_binding.dart';
import '../modules/service_items/views/service_items_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/today/bindings/today_binding.dart';
import '../modules/today/views/today_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.TODAY,
      page: () => const TodayView(),
      binding: TodayBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ORDERS,
      page: () => const NewOrdersView(),
      binding: NewOrdersBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_ITEMS,
      page: () => const ServiceItemsView(),
      binding: ServiceItemsBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS_MANAGER,
      page: () => const BusinessManagerView(),
      binding: BusinessManagerBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => const CustomerView(),
      binding: CustomerBinding(),
      children: [
        GetPage(
          name: _Paths.CUSTOMER_WORK_ORDER,
          page: () => const CustomerWorkOrderView(),
          binding: CustomerWorkOrderBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_PROFILE,
          page: () => const CustomerProfileView(),
          binding: CustomerProfileBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_FAQ,
          page: () => const CustomerFaqView(),
          binding: CustomerFaqBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_TERMS,
          page: () => const CustomerTermsView(),
          binding: CustomerTermsBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_ABOUT_US,
          page: () => const CustomerAboutUsView(),
          binding: CustomerAboutUsBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_PAYMENT_HISTORY,
          page: () => const CustomerPaymentHistoryView(),
          binding: CustomerPaymentHistoryBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER_LANGUAGE,
          page: () => const CustomerLanguageView(),
          binding: CustomerLanguageBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SERVICE_CENTER,
      page: () => const ServiceCenterView(),
      binding: ServiceCenterBinding(),
      children: [
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.WORK_ORDER,
          page: () => const WorkOrderView(),
          binding: WorkOrderBinding(),
        ),
        GetPage(
          name: _Paths.WORK_ORDER_SEARCH,
          page: () => const WorkOrderSearchView(),
          binding: WorkOrderSearchBinding(),
        ),
        GetPage(
          name: _Paths.CALENDAR,
          page: () => const ServiceCenterCalendarView(),
          binding: ServiceCenterCalendarBinding(),
        ),
        GetPage(
          name: _Paths.SERVICE_CENTER_MAPS,
          page: () => const ServiceCenterMapsView(),
          binding: ServiceCenterMapsBinding(),
        ),
        GetPage(
          name: _Paths.WORK_ORDER_VIEW,
          page: () => const WorkOrderViewView(),
          binding: WorkOrderViewBinding(),
          children: [
            GetPage(
              name: _Paths.OVER_VIEW,
              page: () => const OverView(),
              binding: OverViewBinding(),
            ),
            GetPage(
              name: _Paths.INVOICE,
              page: () => const InvoiceView(),
              binding: InvoiceBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.ESTIMATION,
          page: () => const EstimationView(),
          binding: EstimationBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LINE_ITEM,
      page: () => const LineItemView(),
      binding: LineItemBinding(),
    ),
  ];
}
