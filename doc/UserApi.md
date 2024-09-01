# buspass_api.api.UserApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userAuthenticatePost**](UserApi.md#userauthenticatepost) | **POST** /User/Authenticate | 
[**userGetAllUsersGet**](UserApi.md#usergetallusersget) | **GET** /User/GetAllUsers | 
[**userNewUserPost**](UserApi.md#usernewuserpost) | **POST** /User/NewUser | 
[**userRefTokenPost**](UserApi.md#userreftokenpost) | **POST** /User/RefToken | 
[**userUserProfileGet**](UserApi.md#useruserprofileget) | **GET** /User/UserProfile | 
[**userVerifyUserPut**](UserApi.md#userverifyuserput) | **PUT** /User/VerifyUser | 


# **userAuthenticatePost**
> TokenResponse userAuthenticatePost(userCred)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final userCred = UserCred(); // UserCred | 

try {
    final result = api_instance.userAuthenticatePost(userCred);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userAuthenticatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCred** | [**UserCred**](UserCred.md)|  | [optional] 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userGetAllUsersGet**
> List<TblUser> userGetAllUsersGet()



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.userGetAllUsersGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userGetAllUsersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<TblUser>**](TblUser.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userNewUserPost**
> bool userNewUserPost(userAuth)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final userAuth = UserAuth(); // UserAuth | 

try {
    final result = api_instance.userNewUserPost(userAuth);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userNewUserPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userAuth** | [**UserAuth**](UserAuth.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userRefTokenPost**
> TokenResponse userRefTokenPost(tokenResponse)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final tokenResponse = TokenResponse(); // TokenResponse | 

try {
    final result = api_instance.userRefTokenPost(tokenResponse);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userRefTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenResponse** | [**TokenResponse**](TokenResponse.md)|  | [optional] 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userUserProfileGet**
> TblUser userUserProfileGet(userId)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.userUserProfileGet(userId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userUserProfileGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 

### Return type

[**TblUser**](TblUser.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userVerifyUserPut**
> bool userVerifyUserPut(body)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final body = String(); // String | 

try {
    final result = api_instance.userVerifyUserPut(body);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->userVerifyUserPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

