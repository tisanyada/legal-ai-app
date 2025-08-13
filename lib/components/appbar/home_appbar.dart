import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:legalai/components/text/body_text.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/components/text/subtitle_text.dart';
import 'package:legalai/core/providers/index.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_15,
          ),
          child: Row(
            children: [
              // User Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    ServiceRegistry.userRepository.accountInfo.value.firstName
                            .isNotEmpty
                        ? '${ServiceRegistry.userRepository.accountInfo.value.firstName.substring(0, 1)}${ServiceRegistry.userRepository.accountInfo.value.lastName.substring(0, 1)}'
                        : 'SJ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.horizontal_10),
              // Welcome Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BodyText(
                      text: ServiceRegistry.userRepository.accountInfo.value
                              .firstName.isNotEmpty
                          ? ServiceRegistry
                              .userRepository.accountInfo.value.firstName
                          : 'Johnson',
                    ),
                  ],
                ),
              ),

              // Notification Icon with Badge
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FluentIcons.alert_24_regular,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              // Search Icon
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FluentIcons.search_24_regular,
                  size: 24,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
