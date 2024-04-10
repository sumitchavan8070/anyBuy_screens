import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class GetXMainController extends GetxController {
  RxString isLoggedIn = 'Login'.obs;
  RxString onboardOver = 'onboard'.obs;
  RxBool isDrawerOpened = false.obs;

  final selectedIndex = 2.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  final GlobalKey bottomNavigationBarKey = GlobalKey();
  final globalSliderKey = GlobalKey<SliderDrawerState>();

  void openDrawer() {
    globalSliderKey.currentState?.openSlider();
    isDrawerOpened.value = true;
  }

  void closeDrawer() {
    globalSliderKey.currentState?.closeSlider();
    isDrawerOpened.value = false;
  }
}
