# auth_sdk.api.AuthApi

## Load the API package
```dart
import 'package:auth_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerSignIn**](AuthApi.md#authcontrollersignin) | **POST** /v1/auth/signin | 
[**authControllerSignUp**](AuthApi.md#authcontrollersignup) | **POST** /v1/auth/signup | 
[**authControllerSigninOAuth**](AuthApi.md#authcontrollersigninoauth) | **POST** /v1/auth/signin-oauth | 


# **authControllerSignIn**
> SigninResponsePayload authControllerSignIn(signinDTO)



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAuthApi();
final SigninDTO signinDTO = ; // SigninDTO | 

try {
    final response = api.authControllerSignIn(signinDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerSignIn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signinDTO** | [**SigninDTO**](SigninDTO.md)|  | 

### Return type

[**SigninResponsePayload**](SigninResponsePayload.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerSignUp**
> SigninResponsePayload authControllerSignUp(createAccountDTO)



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAuthApi();
final CreateAccountDTO createAccountDTO = ; // CreateAccountDTO | 

try {
    final response = api.authControllerSignUp(createAccountDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerSignUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAccountDTO** | [**CreateAccountDTO**](CreateAccountDTO.md)|  | 

### Return type

[**SigninResponsePayload**](SigninResponsePayload.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerSigninOAuth**
> SigninResponsePayload authControllerSigninOAuth(oAuthSigninDTO)



### Example
```dart
import 'package:auth_sdk/api.dart';

final api = AuthSdk().getAuthApi();
final OAuthSigninDTO oAuthSigninDTO = ; // OAuthSigninDTO | 

try {
    final response = api.authControllerSigninOAuth(oAuthSigninDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerSigninOAuth: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oAuthSigninDTO** | [**OAuthSigninDTO**](OAuthSigninDTO.md)|  | 

### Return type

[**SigninResponsePayload**](SigninResponsePayload.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

