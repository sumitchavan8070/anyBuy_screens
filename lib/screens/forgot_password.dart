import 'package:anybuy/constants/custom_text_field.dart';
import 'package:anybuy/theme/app_box_decoration.dart';
import 'package:anybuy/theme/app_colors.dart';
import 'package:anybuy/theme/asset_path.dart';
import 'package:anybuy/theme/button_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "FORGOT PASSWORD",
               style: Theme.of(context).textTheme.bodyLarge,
             ),
             const SizedBox(height: 8),
             Text(
               "Please enter your email or phone number to verify password reset",
               style: Theme.of(context).textTheme.bodySmall,
             ),
           ],
         ),
       ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
            ),
            child: CustomTextField(
              hintText: "Email address",
              controller: emailController,
              fillColor: AppColors.zircon,
              onChanged: (value) {},
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: ElevatedButton(
              onPressed: () async {
              },
              // Button label
              style: getElevatedButtonStyle(
                borderRadius: 40,
                foregroundColor: AppColors.darkOrange,
                backgroundColor: AppColors.darkOrange,
                elevation: 0,
              ),
              child: Text(
                "SEND NOW",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                        text: 'Still having problems? ',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.midGrey,
                            ),
                      ),
                      TextSpan(
                        text: 'contact CS yuk!',
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
