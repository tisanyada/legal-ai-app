import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/presentation/dashboard/chat_screen.dart';
import 'package:legalai/presentation/dashboard/home_screen.dart';
import 'package:legalai/presentation/dashboard/profile_screen.dart';
import 'package:legalai/presentation/dashboard/documents_screen.dart';
import 'package:legalai/components/navigation/custom_bottom_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const DocumentsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: screens[
              ServiceRegistry.commonRepository.currentScreenIndex.value],
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (int value) {
              ServiceRegistry.commonRepository.currentScreenIndex.value = value;
            },
            currentPage:
                ServiceRegistry.commonRepository.currentScreenIndex.value,
          ),
        );
      },
    );
  }
}
