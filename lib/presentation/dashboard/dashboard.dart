import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:legalai/components/snackbars/custom_snackbar.dart';
import 'package:legalai/core/constants/routes.dart';
import 'package:legalai/core/constants/secrets.dart';
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
  DateTime? currentBackPressTime;

  final List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const DocumentsScreen(),
    const ProfileScreen(),
  ];

  void initializeAppInfo() {
    Future.wait([
      ServiceRegistry.accountService.fetchDetailedUserAccountInfoService(),
    ]);
  }

  @override
  void initState() {
    super.initState();

    initializeAppInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return WillPopScope(
          onWillPop: () async {
            if (ServiceRegistry.localStorage
                        .read(LocalStorageSecrets.accessToken) !=
                    null &&
                ServiceRegistry.localStorage
                        .read(LocalStorageSecrets.authenticationMethod) ==
                    'SECURE') {
              if (currentBackPressTime == null ||
                  DateTime.now().difference(currentBackPressTime!) >
                      const Duration(seconds: 2)) {
                // First press
                currentBackPressTime = DateTime.now();

                customErrorMessageSnackbar(
                  title: 'Message',
                  message: 'Press back again to exit',
                );

                return false;
              }

              SystemNavigator.pop();

              return false;
            } else {
              Get.toNamed(AppRoutes.loginRoute);

              return false;
            }
          },
          child: Scaffold(
            body: screens[
                ServiceRegistry.commonRepository.currentScreenIndex.value],
            bottomNavigationBar: CustomBottomNavigationBar(
              onTap: (int value) {
                ServiceRegistry.commonRepository.currentScreenIndex.value =
                    value;
              },
              currentPage:
                  ServiceRegistry.commonRepository.currentScreenIndex.value,
            ),
          ),
        );
      },
    );
  }
}
