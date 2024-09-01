# buspass_api.api.UserProfilesApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userProfilesAddPost**](UserProfilesApi.md#userprofilesaddpost) | **POST** /UserProfiles/Add | 
[**userProfilesGetAllUserProfilesGet**](UserProfilesApi.md#userprofilesgetalluserprofilesget) | **GET** /UserProfiles/GetAllUserProfiles | 


# **userProfilesAddPost**
> bool userProfilesAddPost(userProfile)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserProfilesApi();
final userProfile = UserProfile(); // UserProfile | 

try {
    final result = api_instance.userProfilesAddPost(userProfile);
    print(result);
} catch (e) {
    print('Exception when calling UserProfilesApi->userProfilesAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userProfile** | [**UserProfile**](UserProfile.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userProfilesGetAllUserProfilesGet**
> List<UserProfile> userProfilesGetAllUserProfilesGet()



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserProfilesApi();

try {
    final result = api_instance.userProfilesGetAllUserProfilesGet();
    print(result);
} catch (e) {
    print('Exception when calling UserProfilesApi->userProfilesGetAllUserProfilesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<UserProfile>**](UserProfile.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

