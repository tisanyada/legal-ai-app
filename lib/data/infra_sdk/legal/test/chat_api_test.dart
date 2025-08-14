import 'package:test/test.dart';
import 'package:legal_sdk/legal_sdk.dart';


/// tests for ChatApi
void main() {
  final instance = LegalSdk().getChatApi();

  group(ChatApi, () {
    //Future<String> legalControllerTestOpenAISdk(String query, { MultipartFile file }) async
    test('test legalControllerTestOpenAISdk', () async {
      // TODO
    });

  });
}
