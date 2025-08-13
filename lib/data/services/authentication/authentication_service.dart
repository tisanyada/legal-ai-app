import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:auth_sdk/auth_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:legalai/core/constants/routes.dart';
import 'package:legalai/core/constants/secrets.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:legalai/components/snackbars/custom_snackbar.dart';

class AuthenticationService extends GetxController {
  RxBool isSignInProcessing = false.obs;
  RxBool isSignUpProcessing = false.obs;
  RxBool isResetPasswordProcessing = false.obs;
  RxBool isForgotPasswordProcessing = false.obs;
  RxBool isResendSignUpOTPSuccessful = false.obs;
  RxBool isResetPasswordOtpVerificationProcessing = false.obs;

  // !SIGNIN
  /// Signin to user account
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /auth/signin-donor
  ///
  /// [BODY] {
  ///     email?: string,
  ///     password?: string,
  /// }
  Future<void> signInService(
    SigninDTO formData, {
    bool resendOtp = false,
  }) async {
    try {
      log("[SIGNIN-PENDING]");

      ServiceRegistry.localStorage.remove(
        LocalStorageSecrets.accessToken,
      );

      isSignInProcessing.value = true;

      AuthApi authApi = ServiceRegistry.authSdk.getAuthApi();

      Dio.Response response = await authApi
          .authControllerSignIn(
            signinDTO: formData,
          )
          .timeout(const Duration(seconds: 30));

      SigninResponsePayload data = response.data;

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('[SIGNIN-RESPONSE] :: $data');

        isSignInProcessing.value = false;

        //ROUTE TO DASHBOARD SCREEN
        customSuccessMessageSnackbar(
          title: 'Message',
          message: 'Login Successful!',
        );

        ServiceRegistry.localStorage.write(
          LocalStorageSecrets.accessToken,
          data.token,
        );
        ServiceRegistry.localStorage.write(
          LocalStorageSecrets.authenticationMethod,
          "SECURE",
        );

        Get.toNamed(AppRoutes.dashboardRoute);

        log("[SIGNIN-SUCCESS]");
      }
    } catch (error) {
      isSignInProcessing.value = false;

      log('[SIGNIN-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[SIGNIN-ERROR-RESPONSE] :: ${dioError.response}');

        if (dioError.response?.data['message'] != null) {
          customErrorMessageSnackbar(
            title: 'Message',
            message: dioError.response?.data['message'],
          );
        }
      }
    } finally {
      isSignInProcessing.value = false;
    }
  }

  // !SIGNUP
  /// Signup to user account
  ///
  /// [METHOD] - POST
  ///
  /// [ROUTE] - /auth/signin-donor
  ///
  /// [BODY] {
  ///     email?: string,
  ///     password?: string,
  /// }
  Future<void> signUpService(
    CreateAccountDTO formData, {
    bool resendOtp = false,
  }) async {
    try {
      log("[SIGNUP-PENDING]");

      ServiceRegistry.localStorage.remove(
        LocalStorageSecrets.accessToken,
      );

      isSignUpProcessing.value = true;

      AuthApi authApi = ServiceRegistry.authSdk.getAuthApi();

      Dio.Response response = await authApi
          .authControllerSignUp(
            createAccountDTO: formData,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('[SIGNUP-RESPONSE] :: $response');

        SigninResponsePayload data = response.data;

        isSignUpProcessing.value = false;

        //ROUTE TO DASHBOARD SCREEN
        customSuccessMessageSnackbar(
          title: 'Message',
          message: 'Signup Successful!',
        );

        ServiceRegistry.localStorage.write(
          LocalStorageSecrets.accessToken,
          data.token,
        );
        ServiceRegistry.localStorage.write(
          LocalStorageSecrets.authenticationMethod,
          "SECURE",
        );

        Get.toNamed(AppRoutes.dashboardRoute);

        log("[SIGNUP-SUCCESS]");
      }
    } catch (error) {
      isSignUpProcessing.value = false;

      log('[SIGNUP-ERROR-RESPONSE] :: $error');

      if (error is Dio.DioException) {
        Dio.DioException dioError = error;

        log('[SIGNUP-ERROR-RESPONSE] :: ${dioError.response}');

        if (dioError.response?.data['message'] != null) {
          customErrorMessageSnackbar(
            title: 'Message',
            message: dioError.response?.data['message'],
          );
        }
      }
    } finally {
      isSignUpProcessing.value = false;
    }
  }
}
