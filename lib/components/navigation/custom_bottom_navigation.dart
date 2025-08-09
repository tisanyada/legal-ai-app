// ignore_for_file: deprecated_member_use
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentPage;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentPage,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            TextStyle textStyle = const TextStyle(
              fontSize: 11,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: AppColors.textTertiaryInverseColor,
            );

            if (states.contains(MaterialState.selected)) {
              textStyle = textStyle.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBackgroundColor,
              );
            }

            return textStyle;
          },
        ),
      ),
      child: NavigationBar(
        height: 60,
        onDestinationSelected: widget.onTap,
        indicatorColor: AppColors.buttonPrimaryDisabledColor.withOpacity(0.4),
        animationDuration: const Duration(seconds: 0),
        selectedIndex:
            ServiceRegistry.commonRepository.currentScreenIndex.value,
        surfaceTintColor: AppColors.whiteColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              FluentIcons.home_12_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.home_12_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              FluentIcons.chat_12_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.chat_12_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(
              FluentIcons.document_bullet_list_16_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.document_bullet_list_16_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: 'Documents',
          ),
          NavigationDestination(
            icon: Icon(
              FluentIcons.person_12_regular,
              size: 20,
              color: AppColors.textTertiaryInverseColor,
            ),
            selectedIcon: Icon(
              FluentIcons.person_12_regular,
              size: 20,
              color: AppColors.primaryBackgroundColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
