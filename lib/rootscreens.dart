import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:anybuy/theme/button_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetPath.backButton,
                    height: 38,
                    width: 38,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: SvgPicture.asset(
                AssetPath.appLogo,
                height: 150,
                width: 200,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "You haven't added it yet whatever...",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 50),
            Text(
              "Come on, find your favorite item!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black.withOpacity(0.50),
                  ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: ElevatedButton(
                onPressed: () async {
                  // context.go(GoPaths.page1);
                },
                // Button label
                style: getElevatedButtonStyle(
                  borderRadius: 40,
                  foregroundColor: AppColors.darkOrange,
                  backgroundColor: AppColors.darkOrange,
                  elevation: 0,
                ),
                child: Text(
                  "Order",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Page 2");
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Page 3");
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Page 4");
  }
}
