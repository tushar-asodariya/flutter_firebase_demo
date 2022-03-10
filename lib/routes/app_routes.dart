import 'package:firebase_demo/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:firebase_demo/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:firebase_demo/presentation/home_screen/binding/home_binding.dart';
import 'package:firebase_demo/presentation/home_screen/home_screen.dart';
import 'package:firebase_demo/presentation/login_screen/binding/login_binding.dart';
import 'package:firebase_demo/presentation/otp_screen/binding/otp_binding.dart';
import 'package:firebase_demo/presentation/otp_screen/otp_screen.dart';
import 'package:firebase_demo/presentation/profile_screen/binding/profile_binding.dart';
import 'package:firebase_demo/presentation/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../presentation/login_screen/login_screen.dart';

class AppRoutes {
  static String homeScreen = '/home_screen';
  static String loginScreen = '/login_screen';
  static String otpScreen = '/otp_screen';
  static String profileScreen = '/profile_screen';
  static String editProfileScreen = '/edit_profile_screen';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpScreen(),
      bindings: [
        OtpBinding(),
      ],
    ),
  ];
}
