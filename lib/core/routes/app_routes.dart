import 'package:get/get.dart';

import '../../main.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';
  // Add more routes here as needed

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const MyApp()),
  ];
}
