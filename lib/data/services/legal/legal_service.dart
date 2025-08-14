import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:legal_sdk/legal_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:legalai/core/middlewares/index.dart';
import 'package:legalai/core/providers/index.dart';
import 'package:legalai/core/constants/secrets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:legalai/data/services/guards/auth_guard.dart';

class LegalService extends GetxController {
  RxBool isProcessing = false.obs;

  //! AI CHAT COMPLETION
  /// Fetch AI Chat Completion.
  ///
  /// [METHOD] - GET
  ///
  /// [ROUTE] - /legal/ai-chat-completion
  ///
  /// [IS-AUTHENTICATED]
  Future<String> aIChatCompletionService({
    required String query,
    PlatformFile? file,
  }) async {
    final result = await authGuard<String>(() async {
      try {
        log("[AI-CHAT-COMPLETION-PENDING]");

        ChatApi chatApi = ServiceRegistry.legalSdk.getChatApi();

        Dio.MultipartFile? multipartFile;
        if (file != null) {
          multipartFile = await Dio.MultipartFile.fromFile(
            file.path!,
            filename: file.name,
            contentType: MediaType.parse(getFileMimeType(file.extension!)),
          );
        }

        Dio.Response response = await chatApi.legalControllerLegalAIChat(
          query: query,
          file: multipartFile,
          headers: {
            "Authorization": ServiceRegistry.localStorage.read(
              LocalStorageSecrets.accessToken,
            ),
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // log('[AI-CHAT-COMPLETION-RESPONSE] :: ${response.data}');

          String text = response.data;

          // ServiceRegistry.userRepository.accountInfo.value = accountInfo;

          log("[AI-CHAT-COMPLETION-SUCCESS]");

          return text;
        }

        return '';
      } catch (error) {
        log('[AI-CHAT-COMPLETION-ERROR-RESPONSE] :: $error');

        if (error is Dio.DioException) {
          Dio.DioException dioError = error;

          log('[AI-CHAT-COMPLETION-DIO-ERROR-RESPONSE] :: ${dioError.response}');
        }

        return '';
      }
    });

    return result ?? '';
  }
}
