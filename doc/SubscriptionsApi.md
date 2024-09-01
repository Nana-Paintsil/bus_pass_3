# buspass_api.api.SubscriptionsApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**subscriptionsAddPost**](SubscriptionsApi.md#subscriptionsaddpost) | **POST** /Subscriptions/Add | 
[**subscriptionsGetAllSubscriptionsGet**](SubscriptionsApi.md#subscriptionsgetallsubscriptionsget) | **GET** /Subscriptions/GetAllSubscriptions | 
[**subscriptionsUpdateSubscriptionPut**](SubscriptionsApi.md#subscriptionsupdatesubscriptionput) | **PUT** /Subscriptions/UpdateSubscription | 


# **subscriptionsAddPost**
> bool subscriptionsAddPost(subscription)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SubscriptionsApi();
final subscription = Subscription(); // Subscription | 

try {
    final result = api_instance.subscriptionsAddPost(subscription);
    print(result);
} catch (e) {
    print('Exception when calling SubscriptionsApi->subscriptionsAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | [**Subscription**](Subscription.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subscriptionsGetAllSubscriptionsGet**
> List<Subscription> subscriptionsGetAllSubscriptionsGet()



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SubscriptionsApi();

try {
    final result = api_instance.subscriptionsGetAllSubscriptionsGet();
    print(result);
} catch (e) {
    print('Exception when calling SubscriptionsApi->subscriptionsGetAllSubscriptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Subscription>**](Subscription.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subscriptionsUpdateSubscriptionPut**
> bool subscriptionsUpdateSubscriptionPut(subscription)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SubscriptionsApi();
final subscription = Subscription(); // Subscription | 

try {
    final result = api_instance.subscriptionsUpdateSubscriptionPut(subscription);
    print(result);
} catch (e) {
    print('Exception when calling SubscriptionsApi->subscriptionsUpdateSubscriptionPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | [**Subscription**](Subscription.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

