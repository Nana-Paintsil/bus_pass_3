# buspass_api.api.BusTicketApi

## Load the API package
```dart
import 'package:buspass_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**busTicketAddPost**](BusTicketApi.md#busticketaddpost) | **POST** /BusTicket/Add | 
[**busTicketGetUserBusTicketsGet**](BusTicketApi.md#busticketgetuserbusticketsget) | **GET** /BusTicket/GetUserBusTickets | 
[**busTicketUpdateBusTicketBusTicketPut**](BusTicketApi.md#busticketupdatebusticketbusticketput) | **PUT** /BusTicket/UpdateBusTicketBusTicket | 


# **busTicketAddPost**
> bool busTicketAddPost(busTicket)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BusTicketApi();
final busTicket = BusTicket(); // BusTicket | 

try {
    final result = api_instance.busTicketAddPost(busTicket);
    print(result);
} catch (e) {
    print('Exception when calling BusTicketApi->busTicketAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **busTicket** | [**BusTicket**](BusTicket.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **busTicketGetUserBusTicketsGet**
> List<BusTicket> busTicketGetUserBusTicketsGet(userId)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BusTicketApi();
final userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.busTicketGetUserBusTicketsGet(userId);
    print(result);
} catch (e) {
    print('Exception when calling BusTicketApi->busTicketGetUserBusTicketsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 

### Return type

[**List<BusTicket>**](BusTicket.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **busTicketUpdateBusTicketBusTicketPut**
> bool busTicketUpdateBusTicketBusTicketPut(busTicket)



### Example
```dart
import 'package:buspass_api/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = BusTicketApi();
final busTicket = BusTicket(); // BusTicket | 

try {
    final result = api_instance.busTicketUpdateBusTicketBusTicketPut(busTicket);
    print(result);
} catch (e) {
    print('Exception when calling BusTicketApi->busTicketUpdateBusTicketBusTicketPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **busTicket** | [**BusTicket**](BusTicket.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

