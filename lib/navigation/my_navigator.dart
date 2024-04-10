
import 'package:anybuy/navigation/go_paths.dart';
import 'package:anybuy/navigation/route_generator.dart';
import 'package:flutter/cupertino.dart';

class MyNavigator {
  static String? currentRoute;

  static void pushNamed(String routeName, {Object? extra}) {
    try {
      debugPrint("Route Changed to $routeName ++++++++++++++ $extra");
      goRouterConfig.pushNamed(routeName, extra: extra);
    } catch (e) {
      debugPrint("+++++++++++++++++++++++++++++navigation  $e");
    }
  }

  static void goNamed(String routeName, {Object? extra}) {
    try {
      goRouterConfig.goNamed(routeName, extra: extra);
    } catch (e) {
      debugPrint("+++++++++++++++++++++++++++++navigation  $e");
    }
  }

  static void popUntilAndPushNamed(String routeName, {Object? extra}) {
    try {
      while (goRouterConfig.canPop()) {
        goRouterConfig.pop();
      }
      goRouterConfig.pushReplacementNamed(routeName, extra: extra);
    } catch (e) {
      debugPrint("Navigation Error: $e");
    }
  }

  static void pop() {
    goRouterConfig.pop();
  }

  static void pushReplacementNamed(String? routeName, {Object? extra}) {
    try {
      goRouterConfig.pushReplacementNamed(routeName ?? GoPaths.homeViewScreen, extra: extra);
    } catch (e) {
      debugPrint("+++++++++++++++++++++++++++++navigation  $e");
    }
  }
}
