import 'package:anybuy/constants/key_value_pair.dart';
import 'package:anybuy/navigation/go_paths.dart';
import 'package:anybuy/navigation/my_navigator.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({
    super.key,
  });

  final drawerData = [
    KeyValuePair(key: "Profile", value: "Profile", path: AssetPath.drawerProfile),
    KeyValuePair(key: "My order", value: "My order", path: AssetPath.drawerCart),
    KeyValuePair(key: "Favorite", value: "Favorite", path: AssetPath.drawerLiked),
    KeyValuePair(key: "Settings", value: "Settings", path: AssetPath.drawerSetting),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 26),
          color: AppColors.darkOrange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetPath.drawerLogo.toString()),
                ],
              ),
              const SizedBox(height: 40),
              ...List.generate(drawerData.length, (index) {
                final item = drawerData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: SvgPicture.asset(
                              item.path.toString(),
                              height: 24,
                              width: 24,
                            ),
                          ),
                          Text(
                            item.key.toString(),
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        indent: 45,
                        endIndent: 30,
                        thickness: 0.85,
                        color: AppColors.whiteSmoke,
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                );
              }),
              GestureDetector(
                onTap: () {
                  MyNavigator.pushNamed(GoPaths.aboutUs );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "About us ",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetPath.drawerLogout),
                    const
                    SizedBox(width: 14),
                    Text(
                      "Sign out",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.white,
                        fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
