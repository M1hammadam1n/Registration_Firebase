import 'package:fier/ui/pages/home_page/home_page.dart';
import 'package:fier/ui/pages/login_page/login_page.dart';
import 'package:fier/ui/pages/register_page/register_page.dart';
import 'package:fier/ui/pages/start_page/start_page.dart';
import 'package:fier/ui/router/app_routers.dart';
import 'package:flutter/material.dart';

class ApppNavigator {
  static String initRoute = AppRoutes.startPage;
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.startPage: (_) => const StartPage(),
      AppRoutes.regPage: (_) => const RegisterPage(),
      AppRoutes.LoginPage: (_) => const LoginPage(),
            AppRoutes.homaPage: (_) => const HomePage(),
    };
  }
}
