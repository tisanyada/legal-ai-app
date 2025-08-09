import 'package:flutter/material.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/components/text/custom_text_widget.dart';

class SmallText extends CustomTextWidget {
  SmallText({
    super.key,
    Color? color,
    double? size,
    TextAlign? alignment,
    double? lineHeight,
    FontWeight? weight,
    required String text,
  }) : super(
          size: size ?? 12,
          text: text,
          alignment: alignment,
          lineHeight: lineHeight,
          weight: weight ?? FontWeight.w400,
          textStyleName: AppTextSizes.bodyText1,
          color: color ?? AppColors.blackColor,
        );
}
