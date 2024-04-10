import 'package:anybuy/constants/drawer_menu.dart';
import 'package:anybuy/constants/getx_main_controller.dart';
import 'package:anybuy/navigation/go_paths.dart';
import 'package:anybuy/navigation/my_navigator.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:anybuy/theme/blurry_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final _getXMainController = Get.put(GetXMainController());

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  final GlobalKey bottomNavigationBarKey = GlobalKey();
  final selectedIndex = 2.obs;

  // int selectedItem = 0;
  // static final List<Widget> _pages = <Widget>[
  //   TabBarExample(key: UniqueKey(),),
  //   Explore(key: UniqueKey(),),
  //   HomePage(key: UniqueKey(),),
  //   UniFinder(key: UniqueKey(),),
  //   // PorfilePage(key: UniqueKey(),)
  //   LoginDetails(key: UniqueKey(),)
  //   // TransactionHistory(key: UniqueKey(),)
  //   // UnpaidApplications(key: UniqueKey(),)
  //   // ApplicationManager(),
  // ];
  // bool shouldShowAppBarAndBottomBar = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Check for the current route here, which runs after initState
  //   _onRouteChanged();
  // }
  //
  // void _onRouteChanged() {
  //   final currentRoute = ModalRoute.of(context)?.settings.name;
  //   // Check if the current route is one of the defined routes
  //   final isDefinedRoute = [
  //     GoPath.login,
  //     GoPath.congratulationScreen,
  //     GoPath.tabBarDocs,
  //     GoPath.explore,
  //     GoPath.homePage,
  //     GoPath.unifinder,
  //     GoPath.chat,
  //   ].contains(currentRoute);
  //
  //   // Update the state to show/hide the app bar and bottom bar
  //   setState(() {
  //     shouldShowAppBarAndBottomBar = isDefinedRoute;
  //   });
  // }
  //
  //
  //

  bool keyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      key: _getXMainController.scaffoldKeyDrawer,
      backgroundColor: AppColors.white,
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child:

              Obx(() =>
              _getXMainController.isDrawerOpened.value == true
                  ? const SizedBox.shrink()
                  :

              BlurryContainer(
                color: selectedIndex.value == 0 ? AppColors.white : AppColors.greenWhite.withOpacity(0.7),
                blur: 10,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go(GoPaths.page1);
                        selectedIndex.value = 0;
                      },
                      child: SvgPicture.asset(
                        selectedIndex.value == 0 ? AssetPath.activeLiked : AssetPath.liked,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(GoPaths.dashboardScreen);
                        selectedIndex.value = 1;
                      },
                      child: SvgPicture.asset(AssetPath.home, height: 20, width: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedIndex.value = 2;
                        context.go(GoPaths.page3);
                      },
                      child: SvgPicture.asset(AssetPath.profile, height: 20, width: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedIndex.value = 3;
                        MyNavigator.pushNamed(GoPaths.page4);
                      },
                      child: SvgPicture.asset(AssetPath.cart, height: 20, width: 20),
                    ),
                  ],
                ),
              ),
              ),
            ),
      // Obx(
      //   () => BottomNavigationBar(
      //     key: bottomNavigationBarKey,
      //     elevation: 0,
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: CupertinoColors.white,
      //     selectedItemColor: AppColors.midGrey,
      //     unselectedItemColor: AppColors.black,
      //     selectedFontSize: 14,
      //     unselectedFontSize: 14,
      //     currentIndex: selectedIndex.toInt(), //New
      //     onTap: (int idx) => _onItemTapped(idx, context),
      //     items: [
      //       BottomNavigationBarItem(
      //         label: 'home',
      //         icon: SvgPicture.asset(AssetPath.home).paddingOnly(bottom: 5),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'home2',
      //         icon: SvgPicture.asset(AssetPath.home).paddingOnly(bottom: 5),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'home 3',
      //         icon: SvgPicture.asset(AssetPath.home).paddingOnly(top: 1.5),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'home 4',
      //         icon: SvgPicture.asset(AssetPath.home).paddingOnly(bottom: 5),
      //       ),
      //
      //     ],
      //   ),
      // ),
      // body: Obx( () => _pages[controller.selectedIndex.toInt()]),
      // drawer: const DrawerMenu(),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(GoPaths.page1);
        break;
      case 1:
        context.go(GoPaths.page2);
        break;
      case 2:
        context.go(GoPaths.page3);
        break;
      case 3:
        context.go(GoPaths.page4);
        break;

      default:
        context.go(GoPaths.homeViewScreen);
    }
  }
}
