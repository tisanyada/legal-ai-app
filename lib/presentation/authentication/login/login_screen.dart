import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:legalai/components/buttons/custom_button.dart';
import 'package:legalai/components/form/form_email_field.dart';
import 'package:legalai/components/form/form_password_field.dart';
import 'package:legalai/components/form/form_text_field.dart';
import 'package:legalai/components/text/title_text.dart';
import 'package:legalai/components/text/subtitle_text.dart';
import 'package:legalai/core/constants/colors.dart';
import 'package:legalai/core/constants/routes.dart';
import 'package:legalai/core/constants/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSignInForm = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _handleSignIn() {
    Get.toNamed(AppRoutes.dashboardRoute);

    if (_formKey.currentState!.validate()) {
      // TODO: Implement sign in logic
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
              child: Column(
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
                          textController: _emailController,
                          label: 'Email Address',
                          hintText: 'Enter your email',
                        ),
                        const SizedBox(height: 8),
                        FormPasswordField(
                          hidePassword: true,
                          passwordController: _passwordController,
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
                        FormTextField(
                          textController: _nameController,
                          label: 'Name',
                          hintText: 'Enter your name',
                        ),
                        const SizedBox(height: 8),
                        FormEmailField(
                          textController: _emailController,
                          label: 'Email Address',
                          hintText: 'Enter your email',
                        ),
                        const SizedBox(height: 8),
                        FormPasswordField(
                          hidePassword: true,
                          passwordController: _passwordController,
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
                  CustomButton(
                    onTapHandler: _handleSignIn,
                    text: 'Sign In',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
