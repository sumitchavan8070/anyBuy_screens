import 'package:anybuy/constants/custom_text_field.dart';
import 'package:anybuy/constants/drawer_menu.dart';
import 'package:anybuy/constants/getx_main_controller.dart';
import 'package:anybuy/constants/key_value_pair.dart';
import 'package:anybuy/theme/app_box_decoration.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final _getXMainController = Get.put(GetXMainController());

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();
  late TabController _tabController;

  final tabBarData = [
    [
      KeyValuePair(
        key: "test 1",
        value: "\$ 400",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product2,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product2,
      ),
    ],
    [
      KeyValuePair(
        key: "PlayStation 5",
        value: "\$ 400",
        path: AssetPath.product2,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "test 2",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
    ],
    [
      KeyValuePair(
        key: "test 1",
        value: "\$ 400",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product2,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product2,
      ),
    ],
    [
      KeyValuePair(
        key: "PlayStation 5",
        value: "\$ 400",
        path: AssetPath.product2,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "Xbox Seriex X",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
      KeyValuePair(
        key: "test 2",
        value: "\$ 359",
        path: AssetPath.product1,
      ),
    ]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabBarData.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      // You can use _tabController.index to get the index of the active tab
      print("Active Tab Index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
        isDraggable: false,
        key: _getXMainController.globalSliderKey,
        appBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const SizedBox(height: 100),
              GestureDetector(
                  onTap: () {
                    if (_getXMainController.isDrawerOpened.value == true) {
                      _getXMainController.closeDrawer();
                    } else {
                      _getXMainController.openDrawer();
                    }
                  },
                  child: Obx(
                    () => SvgPicture.asset(
                      _getXMainController.isDrawerOpened.value ? AssetPath.menuOpen : AssetPath.menuClose,
                      height: 38,
                      width: 38,
                    ),
                  )),
              const Spacer(),
              SvgPicture.asset(
                AssetPath.appLogo,
                height: 38,
                width: 38,
              ),
              const Spacer(),
              SvgPicture.asset(
                AssetPath.ar,
                height: 38,
                width: 38,
              ),
            ],
          ),
        ),
        slider: DrawerMenu(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "let’s Find Your Item!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: AppBoxDecoration.getBorderBoxDecoration(
                  showShadow: false,
                  borderColor: AppColors.black,
                ),
                child: CustomTextField(
                  hintText: "Search",
                  controller: searchController,
                  fillColor: AppColors.zircon,
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: SvgPicture.asset(
                      AssetPath.search,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration:
                    AppBoxDecoration.getBoxDecoration(showShadow: false, borderRadius: 16, color: AppColors.zircon),
              ),
              Container(
                height: 250,
                child: DefaultTabController(
                  length: tabBarData.length, // Number of tabs
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints.expand(height: 50),
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.darkOrange,
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                'Konsol game',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: _tabController.index == 0
                                          ? AppColors.darkOrange
                                          : AppColors.midGrey, // Set active and inactive colors
                                    ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Laptop',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: _tabController.index == 1
                                          ? AppColors.darkOrange
                                          : AppColors.midGrey, // Set active and inactive colors
                                    ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Smartphone',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: _tabController.index == 2
                                          ? AppColors.darkOrange
                                          : AppColors.midGrey, // Set active and inactive colors
                                    ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Mainan',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: _tabController.index == 3
                                          ? AppColors.darkOrange
                                          : AppColors.midGrey, // Set active and inactive colors
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: TabBarView(
                            controller: _tabController,
                            children: List.generate(
                              tabBarData.length,
                              (index) {
                                final item = tabBarData[index];

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      item.length,
                                      (index) {
                                        final data = item[index];

                                        return Container(
                                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          decoration: AppBoxDecoration.getBoxDecoration(
                                            showShadow: true,
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(data.path.toString()),
                                              Text(
                                                data.key,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                              ),
                                              Text(data.value,
                                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                      color: AppColors.darkOrange, fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
