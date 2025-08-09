import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:legalai/components/appbar/default_appbar.dart';
import 'package:legalai/components/text/body_text.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/core/constants/sizes.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DefaultAppbar(title: 'Documents'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Upload Button
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(16),
              padding: EdgeInsets.zero,
              color: AppColors.primaryColor,
              strokeWidth: 2,
              dashPattern: const [4, 4],
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      FluentIcons.arrow_upload_24_regular,
                      color: AppColors.primaryColor,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    BodyText(
                      text: 'Upload Document for Review',
                      color: AppColors.primaryColor,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Document List
            _buildDocumentCard(
              title: 'Lease Agreement Review',
              fileType: 'PDF',
              fileSize: '2.3 MB',
              category: 'Housing',
              status: 'Reviewed',
              statusColor: AppColors.primaryColor,
              daysAgo: '2 days ago',
            ),
            const SizedBox(height: 16),

            _buildDocumentCard(
              title: 'Employment Contract Analysis',
              fileType: 'PDF',
              fileSize: '1.8 MB',
              category: 'Employment',
              status: 'Pending',
              statusColor: Colors.orange,
              daysAgo: '1 week ago',
            ),
            const SizedBox(height: 16),

            _buildDocumentCard(
              title: 'Small Claims Filing',
              fileType: 'PDF',
              fileSize: '956 KB',
              category: 'Civil Law',
              status: 'Completed',
              statusColor: Colors.green,
              daysAgo: '2 weeks ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard({
    required String title,
    required String fileType,
    required String fileSize,
    required String category,
    required String status,
    required Color statusColor,
    required String daysAgo,
  }) {
    return Container(
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
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  FluentIcons.document_24_regular,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(
                      text: title,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4),
                    BodyText(
                      text: '$fileType • $fileSize',
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    FluentIcons.eye_16_regular,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    FluentIcons.arrow_download_16_regular,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                child: BodyText(
                  text: category,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  BodyText(
                    text: status,
                    color: statusColor,
                  ),
                  const SizedBox(width: 12),
                  BodyText(
                    text: daysAgo,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
