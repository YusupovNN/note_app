import 'package:flutter/cupertino.dart';
import 'package:note_app/ui/app_navigator/app_routes.dart';
import 'package:note_app/ui/pages/change_page/change_page.dart';
import 'package:note_app/ui/pages/control_page/control_page.dart';
import 'package:note_app/ui/pages/home_page/home_page.dart';
import 'package:note_app/ui/pages/search_page/search_page.dart';

class AppNavigator {
  static String get initialRoute => AppRoutes.homePage;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.homePage: (context) => const HomePage(),
        AppRoutes.controlPage: (context) => const ControlPage(),
        AppRoutes.changePage: (context) => const ChangePage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
      };
}
