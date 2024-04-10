import 'package:anybuy/theme/app_box_decoration.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeyYellow,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
        decoration: AppBoxDecoration.getBoxDecoration(
          showShadow: true,
          borderRadius: 12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: SvgPicture.asset(
                    AssetPath.backButton,
                    height: 38,
                    width: 38,
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "About Us",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AssetPath.userImage), // Replace with your asset image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                "I have a deep passion for design and aesthetics, and I love to explore the intersection of art and technology. Whether it's crafting pixel-perfect UIs or creating captivating digital paintings, I'm always pushing the boundaries of creativity.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 50),
            SvgPicture.asset(AssetPath.aboutUsLogo)
          ],
        ),
      ),
    );
  }
}
