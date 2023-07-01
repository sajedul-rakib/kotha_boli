import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/bindings.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/log_in_screen.dart';
import 'package:kotha_boli/ui/screens/sign_in_screen/index.dart';
import 'package:kotha_boli/ui/screens/splash_screen/index.dart';

class RoutePages {
  static const String INITIAL = RouteNames.INITIAL;

  static final List<GetPage> routes = [
    //splash screen
    GetPage(
        name: RouteNames.INITIAL,
        page: () => const SplashScreen(),
        binding: SplashScreenBindings()),

    //signin screen screen
    GetPage(
        name: RouteNames.SIGNINSCREEN,
        page: () =>  SignInScreen(),
        binding: SingInBindings()),

    //signin screen screen
    GetPage(
        name: RouteNames.LOGIN,
        page: () =>  LogInScreen(),
        binding: LogInBindings())
  ];
}
