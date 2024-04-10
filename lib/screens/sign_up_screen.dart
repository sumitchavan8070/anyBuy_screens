import 'package:anybuy/constants/custom_text_field.dart';
import 'package:anybuy/navigation/go_paths.dart';
import 'package:anybuy/theme/app_box_decoration.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:anybuy/theme/button_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetPath.backButton,
                  height: 50,
                  width: 50,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetPath.appLogo,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SIGN UP",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Fill in your identity!",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.mountainMist),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Email address",
                  controller: emailController,
                  fillColor: AppColors.zircon,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mountainMist,
                      ),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "Password",
                  controller: passController,
                  fillColor: AppColors.zircon,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone number",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.mountainMist),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: "08XXXXXXX",
                  controller: numberController,
                  fillColor: AppColors.zircon,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: ElevatedButton(
              onPressed: () async {
                context.go(GoPaths.page1);
              },
              // Button label
              style: getElevatedButtonStyle(
                borderRadius: 40,
                foregroundColor: AppColors.darkOrange,
                backgroundColor: AppColors.darkOrange,
                elevation: 0,
              ),
              child: Text(
                "REGISTER NOW",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?  ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.liver, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Sign-in',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.yellowishOrange,
                            ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
