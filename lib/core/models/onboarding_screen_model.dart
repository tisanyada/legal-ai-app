import 'package:flutter/material.dart';

class OnboardingScreenModel {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<String> features;
  final List<Color> gradientColors;

  const OnboardingScreenModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.features,
    required this.gradientColors,
  });
}
