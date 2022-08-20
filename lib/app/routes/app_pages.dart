import 'package:get/get.dart';
import 'package:planrep_mobile/app/core/auth_binding.dart';
import 'package:planrep_mobile/app/main/main_page.dart';
import 'package:planrep_mobile/app/modules/cost_centre/cost_centre_binding.dart';
import 'package:planrep_mobile/app/modules/cost_centre/cost_centre_page.dart';
import 'package:planrep_mobile/app/modules/facility_type/facility_type_binding.dart';
import 'package:planrep_mobile/app/modules/facility_type/facility_type_detail_binding.dart';
import 'package:planrep_mobile/app/modules/facility_type/facility_type_detail_page.dart';
import 'package:planrep_mobile/app/modules/facility_type/facility_type_page.dart';
import 'package:planrep_mobile/app/modules/home/home_binding.dart';
import 'package:planrep_mobile/app/modules/home/home_page.dart';
import 'package:planrep_mobile/app/modules/login/login_binding.dart';
import 'package:planrep_mobile/app/modules/login/login_page.dart';
import 'package:planrep_mobile/app/modules/splash/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        children: []),
    GetPage(
      binding: FacilityTypeBinding(),
      name: Routes.FACILITY_TYPE,
      page: () => FacilityTypePage(),
    ),
    GetPage(
        binding: FacilityTypeDetailBinding(),
        name: Routes.FACILITY_TYPE_DETAIL,
        page: () => FacilityTypeDetailPage()),
    GetPage(
        name: Routes.SPLASH, page: () => SplashPage(), binding: AuthBinding()),
    GetPage(name: Routes.MAIN, page: () => MainPage(), binding: AuthBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: Routes.COST_CENTRE,
        page: () => CostCentrePage(),
        binding: CostCentreBinding()),
  ];
}
