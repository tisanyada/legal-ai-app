import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:account_sdk/account_sdk.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/constants/secrets.dart';
import 'package:legalai/data/services/guards/auth_guard.dart';

class AccountService extends GetxController {
  RxBool isProcessing = false.obs;

  //! FETCH ACCOUNT INFO
  /// Fetch detailed user account info.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /account/me/detailed
  ///
  /// [IS-AUTHENTICATED]
  Future<void> fetchDetailedUserAccountInfoService() async {
    return authGuard<void>(() async {
      if (ServiceRegistry.localStorage
              .read(LocalStorageSecrets.authenticationMethod) ==
          'GUEST') {
        return;
      }

      try {
        log("[FETCH-DETAILED-USER-ACCOUNT-INFO-PENDING]");

        MeApi meApi = ServiceRegistry.accountSdk.getMeApi();

        Dio.Response response =
            await meApi.accountControllerGetDetailedAccountInfo(
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200) {
          // log('[FETCH-DETAILED-USER-ACCOUNT-INFO-RESPONSE] :: ${response.data}');

          AccountInfo accountInfo = response.data;

          ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          log("[FETCH-DETAILED-USER-ACCOUNT-INFO-SUCCESS]");
        }
      } catch (error) {
        log('[FETCH-DETAILED-USER-ACCOUNT-INFO-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[FETCH-DETAILED-USER-ACCOUNT-INFO-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }
      }
    });
  }
}
