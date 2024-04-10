import 'package:anybuy/constants/custom_text_field.dart';
import 'package:anybuy/theme/app_box_decoration.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:anybuy/theme/button_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreenView extends StatefulWidget {
  const AuthScreenView({super.key});

  @override
  State<AuthScreenView> createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
    final emailController = TextEditingController();

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
            child: SvgPicture.asset(
              AssetPath.backButton,
              height: 50,
              width: 50,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              AssetPath.anyBuy,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: CustomTextField(
              hintText: "Email",
              controller: emailController,
              fillColor: AppColors.zircon,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: CustomTextField(
              hintText: "password",
              controller: emailController,
              fillColor: AppColors.zircon,
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot your password?",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: ElevatedButton(
              onPressed: () async {
                debugPrint("outside");
              },
              // Button label
              style: getElevatedButtonStyle(
                borderRadius: 40,
                foregroundColor: AppColors.darkOrange,
                backgroundColor: AppColors.darkOrange,
                elevation: 0,
              ),
              child: Text(
                "Sign In ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Or",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.midGrey),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: AppBoxDecoration.getBorderBoxDecoration(
              showShadow: false,
              borderRadius: 40,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SvgPicture.asset(AssetPath.google),
                ),
                Text(
                  "CONTINUE WITH GOOGLE",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.midGrey, fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.midGrey,
                          ),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.doggerBlule,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
