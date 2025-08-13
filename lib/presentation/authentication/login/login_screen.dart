import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:legalai/core/constants/sizes.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/components/text/subtitle_text.dart';
import 'package:legalai/components/form/form_text_field.dart';
import 'package:legalai/data/infra_sdk/auth/lib/auth_sdk.dart';
import 'package:legalai/components/buttons/custom_button.dart';
import 'package:legalai/components/form/form_email_field.dart';
import 'package:legalai/components/form/form_password_field.dart';
import 'package:legalai/components/snackbars/custom_snackbar.dart';
import 'package:legalai/components/buttons/custom_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSignInForm = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _handleSignIn() {
    if (!emailController.text.isEmail) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Invalid email address',
      );
    } else if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password is incorrect',
      );
    } else {
      SigninDTO formData = SigninDTO((instance) => instance
        ..email = emailController.text.trim()
        ..password = passwordController.text.trim());

      FocusScope.of(context).unfocus();

      ServiceRegistry.authenticationService.signInService(formData);
    }
  }

  void _handleSignUp() {
    if (firstNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'First name is required',
      );
    } else if (lastNameController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Last name is required',
      );
    } else if (!emailController.text.isEmail) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Invalid email address',
      );
    } else if (passwordController.text.isEmpty) {
      return customErrorMessageSnackbar(
        title: 'Message',
        message: 'Password is required',
      );
    } else {
      CreateAccountDTO formData = CreateAccountDTO(
        (instance) => instance
          ..email = emailController.text.trim()
          ..password = passwordController.text.trim()
          ..firstName = firstNameController.text.trim()
          ..lastName = lastNameController.text.trim(),
      );

      FocusScope.of(context).unfocus();

      ServiceRegistry.authenticationService.signUpService(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.horizontal_20),
            child: Form(
              key: _formKey,
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      // Logo and App Name
                      Center(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/logo.jpg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Legal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'AI',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            SubtitleText(
                              text: 'Your trusted legal companion',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Sign In/Up Toggle
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: showSignInForm
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showSignInForm = true;
                                    });
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: showSignInForm
                                          ? Colors.blue
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !showSignInForm
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showSignInForm = false;
                                    });
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: !showSignInForm
                                          ? Colors.blue
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Email & Password Form
                      Visibility(
                        visible: showSignInForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            FormEmailField(
                              textController: emailController,
                              label: 'Email Address',
                              hintText: 'Enter your email',
                            ),
                            const SizedBox(height: 8),
                            FormPasswordField(
                              hidePassword: true,
                              passwordController: passwordController,
                              label: 'Password',
                              hintText: 'Enter your password',
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Email & Password Form
                      Visibility(
                        visible: !showSignInForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppSizes.screenWidth(context) * 0.42,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FormTextField(
                                          label: 'First Name',
                                          hintText: 'Ayomide',
                                          textController: firstNameController,
                                          width: AppSizes.screenWidth(context) *
                                              0.7,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.screenWidth(context) * 0.42,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FormTextField(
                                          label: 'Last Name',
                                          hintText: 'Olayinka',
                                          textController: lastNameController,
                                          width: AppSizes.screenWidth(context) *
                                              0.7,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormEmailField(
                              textController: emailController,
                              label: 'Email Address',
                              hintText: 'Enter your email',
                            ),
                            const SizedBox(height: 8),
                            FormPasswordField(
                              hidePassword: true,
                              passwordController: passwordController,
                              label: 'Password',
                              hintText: 'Enter your password',
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      // Sign In Button
                      (ServiceRegistry.authenticationService.isSignInProcessing
                                  .isTrue ||
                              ServiceRegistry.authenticationService
                                  .isSignUpProcessing.isTrue)
                          ? const CustomLoadingButton(height: 53)
                          : CustomButton(
                              onTapHandler: showSignInForm
                                  ? _handleSignIn
                                  : _handleSignUp,
                              text: showSignInForm ? 'Sign In' : 'Sign Up',
                              width: 100,
                              height: 53,
                              fontSize: 16,
                              borderRadius: 10,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: AppColors.primaryColor,
                            ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
