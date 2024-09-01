//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BusTicketApi {
  BusTicketApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /BusTicket/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [BusTicket] busTicket:
  Future<Response> busTicketAddPostWithHttpInfo({
    BusTicket? busTicket,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/BusTicket/Add';

    // ignore: prefer_final_locals
    Object? postBody = busTicket;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[
      'application/json',
      'text/json',
      'application/*+json'
    ];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [BusTicket] busTicket:
  Future<bool?> busTicketAddPost({
    BusTicket? busTicket,
  }) async {
    final response = await busTicketAddPostWithHttpInfo(
      busTicket: busTicket,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'bool',
      ) as bool;
    }
    return null;
  }

  /// Performs an HTTP 'GET /BusTicket/GetUserBusTickets' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId:
  Future<Response> busTicketGetUserBusTicketsGetWithHttpInfo(
      {String? userId, String? token}) async {
    // ignore: prefer_const_declarations
    final path = r'/BusTicket/GetUserBusTickets';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    //final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final headers = {'Authorization': 'Bearer $token'};
    if (userId != null) {
      queryParams.addAll(_queryParams('', 'userId', userId));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headers,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] userId:
  Future<List<BusTicket>?> busTicketGetUserBusTicketsGet(
      {String? userId, String? token}) async {
    final response = await busTicketGetUserBusTicketsGetWithHttpInfo(
        userId: userId, token: token);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<BusTicket>')
              as List)
          .cast<BusTicket>()
          .toList();
    }
    return null;
  }

  /// Performs an HTTP 'PUT /BusTicket/UpdateBusTicketBusTicket' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [BusTicket] busTicket:
  Future<Response> busTicketUpdateBusTicketBusTicketPutWithHttpInfo({
    BusTicket? busTicket,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/BusTicket/UpdateBusTicketBusTicket';

    // ignore: prefer_final_locals
    Object? postBody = busTicket;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[
      'application/json',
      'text/json',
      'application/*+json'
    ];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [BusTicket] busTicket:
  Future<bool?> busTicketUpdateBusTicketBusTicketPut({
    BusTicket? busTicket,
  }) async {
    final response = await busTicketUpdateBusTicketBusTicketPutWithHttpInfo(
      busTicket: busTicket,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'bool',
      ) as bool;
    }
    return null;
  }
}
