# buspass_api.api.JourneyApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**journeyAddPost**](JourneyApi.md#journeyaddpost) | **POST** /Journey/Add | 
[**journeyGetAllJourneysGet**](JourneyApi.md#journeygetalljourneysget) | **GET** /Journey/GetAllJourneys | 
[**journeyGetUpdatedJourneyDetailsGet**](JourneyApi.md#journeygetupdatedjourneydetailsget) | **GET** /Journey/GetUpdatedJourneyDetails | 
[**journeyUpdateJourneyPut**](JourneyApi.md#journeyupdatejourneyput) | **PUT** /Journey/UpdateJourney | 


# **journeyAddPost**
> bool journeyAddPost(journey)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JourneyApi();
final journey = Journey(); // Journey | 

try {
    final result = api_instance.journeyAddPost(journey);
    print(result);
} catch (e) {
    print('Exception when calling JourneyApi->journeyAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **journey** | [**Journey**](Journey.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **journeyGetAllJourneysGet**
> List<Journey> journeyGetAllJourneysGet()



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JourneyApi();

try {
    final result = api_instance.journeyGetAllJourneysGet();
    print(result);
} catch (e) {
    print('Exception when calling JourneyApi->journeyGetAllJourneysGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Journey>**](Journey.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **journeyGetUpdatedJourneyDetailsGet**
> Journey journeyGetUpdatedJourneyDetailsGet(guid)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JourneyApi();
final guid = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.journeyGetUpdatedJourneyDetailsGet(guid);
    print(result);
} catch (e) {
    print('Exception when calling JourneyApi->journeyGetUpdatedJourneyDetailsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **String**|  | [optional] 

### Return type

[**Journey**](Journey.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **journeyUpdateJourneyPut**
> bool journeyUpdateJourneyPut(journey)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = JourneyApi();
final journey = Journey(); // Journey | 

try {
    final result = api_instance.journeyUpdateJourneyPut(journey);
    print(result);
} catch (e) {
    print('Exception when calling JourneyApi->journeyUpdateJourneyPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **journey** | [**Journey**](Journey.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

