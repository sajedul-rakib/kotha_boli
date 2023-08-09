import 'package:kotha_boli/middlewares/splash_screen_middlewares.dart';
import 'package:kotha_boli/routes/route_name/route_names.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/chat_screen/index.dart';
import 'package:kotha_boli/ui/screens/contact/bindings.dart';
import 'package:kotha_boli/ui/screens/contact/contact_screen.dart';
import 'package:kotha_boli/ui/screens/find_friend_screen/index.dart';
import 'package:kotha_boli/ui/screens/friend_request_screen/index.dart';
import 'package:kotha_boli/ui/screens/main_bottom_navigation/index.dart';
import 'package:kotha_boli/ui/screens/sign_in_screen/index.dart';
import 'package:kotha_boli/ui/screens/splash_screen/index.dart';
import 'package:kotha_boli/ui/screens/home_screen/index.dart';
import 'package:kotha_boli/ui/screens/log_in_screen/index.dart';

class RoutePages {
  static const String INITIAL = RouteNames.INITIAL;
  static const String MAINBOTTOMNAVBAR = RouteNames.MAINBOTTOMNAVIGATION;

  static final List<GetPage> routes = [
    //main bottom nav bar
    GetPage(
        name: RouteNames.MAINBOTTOMNAVIGATION,
        page: () => MainBottomNavBar(),
        binding: BottomNavBarBindings()),

    //splash screen
    GetPage(
        name: RouteNames.INITIAL,
        page: () =>const  SplashScreen(),
        binding: SplashScreenBindings(),
        // middlewares: [SplashScreenMiddlewares(priority: 1)]
    ),

    //signin  screen
    GetPage(
        name: RouteNames.SIGNINSCREEN,
        page: () => SignInScreen(),
        binding: SingInBindings()),

    //login  screen
    GetPage(
        name: RouteNames.LOGIN,
        page: () => LogInScreen(),
        binding: LogInBindings()),

    //home  screen
    GetPage(
        name: RouteNames.HOMESCREEN,
        page: () =>  HomeScreen(),
        binding: HomeScreenBindings()),

    //chat  screen
    GetPage(
        name: RouteNames.CHATSCREEN,
        page: () => const ChatScreen(),
        binding: ChatScreenBindings()),

    //contact screen
    GetPage(
        name: RouteNames.CONTACTSCREEN,
        page: () => const ContactScreen(),
        binding: ContactScreenBindings()),

    //find friend screen
    GetPage(
        name: RouteNames.FINDFRIENDSCREEN,
        page: () => const FindFriendScreen(),
        binding: FindFriendBindings()),

    //friend request  screen
    GetPage(
        name: RouteNames.FRIENDREQUESTSCREEN,
        page: () => const FriendRequestScreen(),
        binding: FriendRequestBindings())

  ];
}
