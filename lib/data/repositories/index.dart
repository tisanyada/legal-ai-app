// ignore_for_file: unused_local_variable
import 'package:get/get.dart';
import 'package:legalai/data/services/account/account_service.dart';
import 'package:legalai/data/repositories/user_repository.dart';
import 'package:legalai/data/repositories/common_repository.dart';
import 'package:legalai/data/services/authentication/authentication_service.dart';

class RootRepository extends GetxController {
  initialize() {
    Get.put(CommonRepository());

    Get.put(UserRepository());

    Get.put(AccountService());

    Get.put(AuthenticationService());
  }
}
