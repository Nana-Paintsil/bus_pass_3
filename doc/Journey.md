# buspass_api.model.Journey

## Load the model package
```dart
import 'package:buspass_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**tenantId** | **String** |  | [optional] 
**startingPoint** | **String** |  | [optional] 
**destination** | **String** |  | [optional] 
**stops** | [**List<Stop>**](Stop.md) |  | [optional] [default to const []]
**price** | **double** |  | [optional] 
**isActive** | **bool** |  | [optional] 
**estimatedDuration** | [**TimeSpan**](TimeSpan.md) |  | [optional] 
**isDeleted** | **bool** |  | [optional] 
**activeBus** | [**Bus**](Bus.md) |  | [optional] 
**busesInTransit** | [**List<Bus>**](Bus.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


