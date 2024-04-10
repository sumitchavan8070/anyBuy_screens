import 'package:anybuy/constants/bottom_navigation.dart';
import 'package:anybuy/navigation/go_paths.dart';
import 'package:anybuy/rootscreens.dart';
import 'package:anybuy/screens/auth_screen_view.dart';
import 'package:anybuy/screens/dashboard_view.dart';
import 'package:anybuy/screens/forgot_password.dart';
import 'package:anybuy/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');

// final prefs = GetStorage();

final GoRouter goRouterConfig = GoRouter(
  // initialLocation: GoPaths.loginWithNetwork,
  // initialLocation: GoPaths.dashboardScreen,

  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,

  routes: [
    ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          debugPrint("hihteish ${GoRouterState.of(context).matchedLocation}");
          return BottomNavigation(child: child);
        },
        routes: [
          GoRoute(
              path: GoPaths.page1,
              name: GoPaths.page1,
              parentNavigatorKey: shellNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Page1());
              }),
          GoRoute(
              path: GoPaths.dashboardScreen,
              name: GoPaths.dashboardScreen,
              parentNavigatorKey: shellNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: DashboardScreen());
              }),

          GoRoute(
              path: GoPaths.page3,
              name: GoPaths.page3,
              parentNavigatorKey: shellNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Page3());
              }),
          GoRoute(
              path: GoPaths.page4,
              name: GoPaths.page4,
              parentNavigatorKey: shellNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Page4());
              }),
        ]),

    // -------------------------------------- X --------------------------------------

    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: GoPaths.homeViewScreen,
      name: GoPaths.homeViewScreen,
      builder: (context, state) {
        return const AuthScreenView();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: GoPaths.forgotPassword,
      name: GoPaths.forgotPassword,
      builder: (context, state) {
        return const ForgotPassword();
      },
    ),



    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: GoPaths.signUpScreen,
      name: GoPaths.signUpScreen,
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
  ],
);
