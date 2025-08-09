import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:legalai/components/text/body_text.dart';
import 'package:legalai/components/text/subtitle_text.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/components/text/title_text.dart';
import 'package:legalai/components/appbar/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: HomeAppbar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.vertical_20),
            const TitleText(
              size: 20,
              title: 'Quick Actions',
              weight: FontWeight.w600,
            ),
            const SizedBox(height: AppSizes.vertical_20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio:
                  1.4, // This will make the containers shorter (increase for shorter height)
              children: [
                // Ask Legal AI Card
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.chat_24_regular,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Ask Legal AI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Scan Document Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.camera_24_regular,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Scan Document',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Voice Query Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.mic_24_regular,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Voice Query',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // More Actions Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.add_24_regular,
                        color: Colors.grey[600],
                        size: 32,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'More Actions',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.vertical_30),
            const TitleText(
              size: 20,
              weight: FontWeight.w600,
              title: 'Your Legal Activity',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleText(
                  size: 20,
                  weight: FontWeight.w600,
                  title: 'Recent Conversations',
                ),
                BodyText(
                  text: 'View All',
                  weight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.vertical_10),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Lease Agreement Review Card
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleText(
                            size: 16,
                            title: 'Lease Agreement Review',
                            weight: FontWeight.w600,
                          ),
                          Icon(
                            FluentIcons.checkmark_circle_24_filled,
                            color: Colors.green[400],
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: 'Can you help me understand this rental clause?',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Housing',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                FluentIcons.clock_24_regular,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '2 hours ago',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Employment Contract Card
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleText(
                            size: 16,
                            title: 'Employment Contract',
                            weight: FontWeight.w600,
                          ),
                          Icon(
                            FluentIcons.warning_24_regular,
                            color: Colors.orange[400],
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: 'Questions about non-compete clauses...',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Employment',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                FluentIcons.clock_24_regular,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Yesterday',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Small Claims Guidance Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleText(
                            size: 16,
                            title: 'Small Claims Guidance',
                            weight: FontWeight.w600,
                          ),
                          Icon(
                            FluentIcons.checkmark_circle_24_filled,
                            color: Colors.green[400],
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: 'What\'s the process for filing a claim?',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Civil Law',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                FluentIcons.clock_24_regular,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '3 days ago',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.vertical_30),

            const TitleText(
              size: 20,
              weight: FontWeight.w600,
              title: 'Legal Topics',
            ),
            const SizedBox(height: AppSizes.vertical_10),

            // Legal Topics Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.95, // Increased height of cards
              children: [
                // Contract Law Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.document_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Contract Law',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Review & analyze contracts',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: '156 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Housing Rights Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.home_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Housing Rights',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Tenant & landlord issues',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: '89 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Employment Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.briefcase_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Employment',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Workplace legal matters',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: '234 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Family Law Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.people_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Family Law',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Family legal guidance',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: '67 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Consumer Rights Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.shield_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Consumer Rights',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Protection & disputes',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      BodyText(
                        text: '123 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // Business Law Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FluentIcons.arrow_trending_24_filled,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TitleText(
                        size: 16,
                        title: 'Business Law',
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Small business help',
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      BodyText(
                        text: '98 questions answered',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.vertical_20),
          ],
        ),
      ),
    );
  }
}
