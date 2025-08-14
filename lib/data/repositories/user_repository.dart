// ignore_for_file: library_prefixes
import 'package:get/get.dart';
import 'package:account_sdk/account_sdk.dart' as AccountSdk;

class UserRepository extends GetxController {
  Rx<AccountSdk.AccountInfo> accountInfo = AccountSdk.AccountInfo(
    (account) => account
      ..id = '0'
      ..firstName = ''
      ..lastName = ''
      ..email = ''
      ..status = AccountSdk.AccountInfoStatusEnum.active
      ..avatar =
          'https://medexer.s3.eu-north-1.amazonaws.com/avatars/avatar.png',
  ).obs;
}
