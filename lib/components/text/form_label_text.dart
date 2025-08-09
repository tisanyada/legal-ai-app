import 'package:flutter/material.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/components/text/custom_text_widget.dart';

class FormLabelText extends CustomTextWidget {
  FormLabelText({
    super.key,
    double size = 14,
    FontWeight? weight,
    required String text,
  }) : super(
          size: size,
          text: text,
          weight: weight ?? FontWeight.w500,
          textStyleName: AppTextSizes.bodyText1,
        );
}
