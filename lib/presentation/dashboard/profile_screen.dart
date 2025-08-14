import 'package:flutter/material.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/components/text/body_text.dart';
import 'package:legalai/components/text/title_text.dart';
import 'package:legalai/components/appbar/default_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:legalai/data/services/authentication/auth_middlewares.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required Color backgroundColor,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_15,
          vertical: AppSizes.vertical_15,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: Colors.grey[700]),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BodyText(
                text: title,
                weight: FontWeight.w500,
              ),
            ),
            Icon(
              FluentIcons.chevron_right_24_regular,
              size: 20,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DefaultAppbar(title: 'Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Avatar
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: TitleText(
                  title: 'SJ',
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name
            const TitleText(
              title: 'Sarah Johnson',
              size: 24,
              weight: FontWeight.w600,
            ),
            const SizedBox(height: 8),

            // Email
            BodyText(
              text: 'sarah.johnson@email.com',
              color: Colors.grey[600],
              size: 16,
            ),
            const SizedBox(height: 32),

            // Membership Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(
                      text: 'Member since',
                      size: 16,
                    ),
                    const SizedBox(height: 4),
                    BodyText(
                      text: 'January 2024',
                      color: Colors.grey[600],
                      size: 16,
                    ),
                  ],
                ),
                Container(
                  height: 24,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.grey[300],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BodyText(
                          text: 'Pro Plan',
                          color: AppColors.primaryColor,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    BodyText(
                      text: 'Active',
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.vertical_20),
            const TitleText(
              size: 20,
              weight: FontWeight.w600,
              title: 'Activity Summary',
            ),
            const SizedBox(height: AppSizes.vertical_10),

            // Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Questions Asked
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleText(
                      size: 24,
                      title: '24',
                      weight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      weight: FontWeight.w500,
                      text: 'Questions Asked',
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      text: '+3 this week',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleText(
                      size: 24,
                      title: '8',
                      color: Colors.green,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      weight: FontWeight.w500,
                      text: 'Documents Reviewed',
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      text: '+3 this month',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleText(
                      size: 24,
                      title: '12',
                      weight: FontWeight.w600,
                      color: Colors.purple,
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      weight: FontWeight.w500,
                      text: 'Hours Saved',
                    ),
                    const SizedBox(height: AppSizes.vertical_10),
                    BodyText(
                      text: 'Estimated',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.vertical_30),
            const Divider(color: AppColors.grayLightColor),
            // Settings Menu
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildSettingsItem(
                    icon: FluentIcons.person_24_regular,
                    title: 'Edit Profile',
                    backgroundColor: Colors.grey[100]!,
                  ),
                  Divider(color: Colors.grey[200], height: 1),
                  _buildSettingsItem(
                    icon: FluentIcons.alert_24_regular,
                    title: 'Notifications',
                    backgroundColor: Colors.grey[100]!,
                  ),
                  Divider(color: Colors.grey[200], height: 1),
                  _buildSettingsItem(
                    icon: FluentIcons.shield_24_regular,
                    title: 'Privacy & Security',
                    backgroundColor: Colors.grey[100]!,
                  ),
                  Divider(color: Colors.grey[200], height: 1),
                  _buildSettingsItem(
                    icon: FluentIcons.question_circle_24_regular,
                    title: 'Help & Support',
                    backgroundColor: Colors.grey[100]!,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.vertical_20),

            // Sign Out Button
            InkWell(
              onTap: () {
                userLogoutHandler(context: context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.sign_out_24_regular,
                      color: Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    BodyText(
                      text: 'Sign Out',
                      color: Colors.red,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),

            // Version and Copyright

            BodyText(
              text: 'LegalAI v1.0.0',
              color: Colors.grey[600],
            ),
            const SizedBox(height: 4),
            BodyText(
              text: '© 2025 LegalAI. All rights reserved.',
              color: Colors.grey[600],
            ),

            const SizedBox(height: AppSizes.vertical_20),
          ],
        ),
      ),
    );
  }
}
