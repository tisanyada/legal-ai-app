// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/constants/routes.dart';
import 'package:legalai/core/constants/secrets.dart';
import 'package:legalai/components/snackbars/custom_snackbar.dart';
import 'package:legalai/data/infra_sdk/account/lib/account_sdk.dart';

void userLogoutHandler({
  BuildContext? context,
  bool hasContext = false,
  String displayMessage = 'Logged out!',
}) async {
  ServiceRegistry.localStorage.remove(LocalStorageSecrets.accessToken);
  ServiceRegistry.localStorage.remove(LocalStorageSecrets.authenticationMethod);

  if (hasContext == true) {
    Navigator.of(context!).pop();
  }

  customSuccessMessageSnackbar(
    title: 'Message',
    message: displayMessage,
  );

  ServiceRegistry.commonRepository.currentScreenIndex.value = 0;

  Get.toNamed(AppRoutes.loginRoute);

  await Future.delayed(const Duration(milliseconds: 300));

  ServiceRegistry.userRepository.accountInfo.value = AccountInfo(
    (account) => account
      ..id = '0'
      ..firstName = ''
      ..lastName = ''
      ..email = ''
      ..status = AccountInfoStatusEnum.active
      ..avatar =
          'https://medexer.s3.eu-north-1.amazonaws.com/avatars/avatar.png',
  );
}
