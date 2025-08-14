# legal_sdk.api.ChatApi

## Load the API package
```dart
import 'package:legal_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**legalControllerLegalAIChat**](ChatApi.md#legalcontrollerlegalaichat) | **POST** /v1/legal/legal/complete-legal-ai-chat | 


# **legalControllerLegalAIChat**
> String legalControllerLegalAIChat(query, file)



### Example
```dart
import 'package:legal_sdk/api.dart';

final api = LegalSdk().getChatApi();
final String query = Can you generate for me an employment letter sample for an AI company; // String | Query of the legal document.
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.legalControllerLegalAIChat(query, file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChatApi->legalControllerLegalAIChat: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Query of the legal document. | 
 **file** | **MultipartFile**|  | [optional] 

### Return type

**String**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

