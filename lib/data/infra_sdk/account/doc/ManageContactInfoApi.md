# account_sdk.api.ManageContactInfoApi

## Load the API package
```dart
import 'package:account_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountControllerUpdateAccountEmail**](ManageContactInfoApi.md#accountcontrollerupdateaccountemail) | **POST** /v1/account/me/update-email | 
[**accountControllerUpdateAccountName**](ManageContactInfoApi.md#accountcontrollerupdateaccountname) | **PATCH** /v1/account/me/update-name | 
[**accountControllerVerifyNewAccountEmail**](ManageContactInfoApi.md#accountcontrollerverifynewaccountemail) | **PATCH** /v1/account/me/verify-new-email | 


# **accountControllerUpdateAccountEmail**
> accountControllerUpdateAccountEmail(updateAccountEmailDTO)



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getManageContactInfoApi();
final UpdateAccountEmailDTO updateAccountEmailDTO = ; // UpdateAccountEmailDTO | 

try {
    api.accountControllerUpdateAccountEmail(updateAccountEmailDTO);
} catch on DioException (e) {
    print('Exception when calling ManageContactInfoApi->accountControllerUpdateAccountEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateAccountEmailDTO** | [**UpdateAccountEmailDTO**](UpdateAccountEmailDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountControllerUpdateAccountName**
> AccountInfo accountControllerUpdateAccountName(updateAccountNameDTO)



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getManageContactInfoApi();
final UpdateAccountNameDTO updateAccountNameDTO = ; // UpdateAccountNameDTO | 

try {
    final response = api.accountControllerUpdateAccountName(updateAccountNameDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ManageContactInfoApi->accountControllerUpdateAccountName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateAccountNameDTO** | [**UpdateAccountNameDTO**](UpdateAccountNameDTO.md)|  | 

### Return type

[**AccountInfo**](AccountInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountControllerVerifyNewAccountEmail**
> AccountInfo accountControllerVerifyNewAccountEmail(verifyNewAccountEmailDTO)



### Example
```dart
import 'package:account_sdk/api.dart';

final api = AccountSdk().getManageContactInfoApi();
final VerifyNewAccountEmailDTO verifyNewAccountEmailDTO = ; // VerifyNewAccountEmailDTO | 

try {
    final response = api.accountControllerVerifyNewAccountEmail(verifyNewAccountEmailDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ManageContactInfoApi->accountControllerVerifyNewAccountEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyNewAccountEmailDTO** | [**VerifyNewAccountEmailDTO**](VerifyNewAccountEmailDTO.md)|  | 

### Return type

[**AccountInfo**](AccountInfo.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

