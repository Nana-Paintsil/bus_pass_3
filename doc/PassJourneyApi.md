# buspass_api.api.PassJourneyApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**passJourneyAddPost**](PassJourneyApi.md#passjourneyaddpost) | **POST** /PassJourney/Add | 
[**passJourneyGetAllPassJourneysGet**](PassJourneyApi.md#passjourneygetallpassjourneysget) | **GET** /PassJourney/GetAllPassJourneys | 
[**passJourneyUpdatePassJourneyPut**](PassJourneyApi.md#passjourneyupdatepassjourneyput) | **PUT** /PassJourney/UpdatePassJourney | 


# **passJourneyAddPost**
> bool passJourneyAddPost(passJourney)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PassJourneyApi();
final passJourney = PassJourney(); // PassJourney | 

try {
    final result = api_instance.passJourneyAddPost(passJourney);
    print(result);
} catch (e) {
    print('Exception when calling PassJourneyApi->passJourneyAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passJourney** | [**PassJourney**](PassJourney.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passJourneyGetAllPassJourneysGet**
> List<PassJourney> passJourneyGetAllPassJourneysGet()



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PassJourneyApi();

try {
    final result = api_instance.passJourneyGetAllPassJourneysGet();
    print(result);
} catch (e) {
    print('Exception when calling PassJourneyApi->passJourneyGetAllPassJourneysGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<PassJourney>**](PassJourney.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passJourneyUpdatePassJourneyPut**
> bool passJourneyUpdatePassJourneyPut(passJourney)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PassJourneyApi();
final passJourney = PassJourney(); // PassJourney | 

try {
    final result = api_instance.passJourneyUpdatePassJourneyPut(passJourney);
    print(result);
} catch (e) {
    print('Exception when calling PassJourneyApi->passJourneyUpdatePassJourneyPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passJourney** | [**PassJourney**](PassJourney.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

