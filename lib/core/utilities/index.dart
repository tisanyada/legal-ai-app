import 'package:flutter/material.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:legalai/core/models/onboarding_screen_model.dart';

final List<OnboardingScreenModel> onboardingScreens = [
  OnboardingScreenModel(
    id: 1,
    title: "Welcome to LegalAid AI",
    subtitle: "Your trusted legal companion",
    description:
        "Get instant, reliable legal guidance whenever you need it. Our AI assistant is here to help you navigate legal questions with confidence.",
    icon: FluentIcons.scales_20_regular,
    features: ["24/7 availability", "Instant responses", "Expert knowledge"],
    gradientColors: [
      AppColors.primaryLightColor,
      AppColors.primaryColor,
    ],
  ),
  OnboardingScreenModel(
    id: 2,
    title: "Smart Legal Assistance",
    subtitle: "Powered by advanced AI",
    description:
        "Ask questions about contracts, tenant rights, employment law, and more. Get clear, actionable advice tailored to your specific situation.",
    icon: FluentIcons.chat_24_regular,
    features: [
      "Contract analysis",
      "Legal document help",
      "Rights explanation"
    ],
    gradientColors: [
      const Color(0xFF059669), // legal-green-600
      const Color(0xFF1D4ED8), // legal-blue-700
    ],
  ),
  OnboardingScreenModel(
    id: 3,
    title: "Expert Legal Knowledge",
    subtitle: "Trained on comprehensive legal data",
    description:
        "Our AI has been trained on extensive legal databases to provide accurate, up-to-date information across multiple areas of law.",
    icon: FluentIcons.people_24_regular,
    features: [
      "Multiple practice areas",
      "Current legal standards",
      "Comprehensive coverage"
    ],
    gradientColors: [
      const Color(0xFF059669), // legal-green-600
      const Color(0xFF047857), // legal-green-700
    ],
  ),
  OnboardingScreenModel(
    id: 4,
    title: "Secure & Confidential",
    subtitle: "Your privacy is our priority",
    description:
        "All conversations are encrypted and confidential. We maintain the highest standards of security for your legal discussions.",
    icon: FluentIcons.shield_24_regular,
    features: [
      "End-to-end encryption",
      "No data sharing",
      "Complete confidentiality"
    ],
    gradientColors: [
      const Color(0xFF047857), // legal-green-700
      const Color(0xFF2563EB), // legal-blue-600
    ],
  ),
];
