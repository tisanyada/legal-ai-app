import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/core/utilities/index.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/core/constants/routes.dart';
import 'package:legalai/components/text/body_text.dart';
import 'package:legalai/components/text/title_text.dart';
import 'package:legalai/components/buttons/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.vertical_20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FluentIcons.chevron_left_12_regular,
                    size: 16,
                  ),
                  Row(
                    children: List.generate(
                      onboardingScreens.length,
                      (index) => Container(
                        height: 6,
                        width: index == currentIndex ? 40 : 6,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? AppColors.primaryColor
                              : AppColors.grayColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.loginRoute);
                    },
                    child: BodyText(
                      text: "Skip",
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.vertical_20),
              Container(
                height: 280,
                width: double.maxFinite,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: onboardingScreens[currentIndex].gradientColors,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Icon(
                          onboardingScreens[currentIndex].icon,
                          size: 40,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.vertical_15),
                    TitleText(
                      size: 25,
                      weight: FontWeight.w600,
                      color: AppColors.whiteColor,
                      title: onboardingScreens[currentIndex].title,
                    ),
                    const SizedBox(height: AppSizes.vertical_5),
                    BodyText(
                      size: 16,
                      color: AppColors.grayLightColor,
                      text: onboardingScreens[currentIndex].subtitle,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      size: 16,
                      lineHeight: 1.5,
                      alignment: TextAlign.center,
                      color: AppColors.whiteColor,
                      text: onboardingScreens[currentIndex].description,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.vertical_20),
              const TitleText(
                size: 20,
                title: 'Key Features',
                weight: FontWeight.w600,
              ),
              const SizedBox(height: AppSizes.vertical_10),
              Column(
                children: List.generate(
                  onboardingScreens[currentIndex].features.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(
                      bottom: AppSizes.vertical_10,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          FluentIcons.checkmark_circle_16_regular,
                          color: AppColors.greenColor,
                          size: 16,
                        ),
                        const SizedBox(width: AppSizes.horizontal_10),
                        BodyText(
                          size: 16,
                          color: AppColors.blackColor,
                          text: onboardingScreens[currentIndex].features[index],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          left: AppSizes.horizontal_15,
          right: AppSizes.horizontal_15,
          bottom: AppSizes.vertical_10,
        ),
        child: CustomButton(
          text: currentIndex < onboardingScreens.length - 1
              ? 'Continue'
              : 'Get Started',
          width: double.maxFinite,
          height: 53,
          fontSize: 16,
          borderRadius: 16,
          onTapHandler: () {
            if (currentIndex < onboardingScreens.length - 1) {
              setState(() {
                currentIndex++;
              });
            } else {
              Get.toNamed(AppRoutes.loginRoute);
            }
          },
          fontWeight: FontWeight.w600,
          fontColor: AppColors.whiteColor,
          backgroundColor: AppColors.buttonPrimaryColor,
        ),
      ),
    );
  }
}
