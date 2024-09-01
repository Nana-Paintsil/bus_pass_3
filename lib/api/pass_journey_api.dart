//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassJourneyApi {
  PassJourneyApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /PassJourney/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PassJourney] passJourney:
  Future<Response> passJourneyAddPostWithHttpInfo({
    PassJourney? passJourney,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/PassJourney/Add';

    // ignore: prefer_final_locals
    Object? postBody = passJourney;

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
  /// * [PassJourney] passJourney:
  Future<bool?> passJourneyAddPost({
    PassJourney? passJourney,
  }) async {
    final response = await passJourneyAddPostWithHttpInfo(
      passJourney: passJourney,
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

  /// Performs an HTTP 'GET /PassJourney/GetAllPassJourneys' operation and returns the [Response].
  Future<Response> passJourneyGetAllPassJourneysGetWithHttpInfo(
      String token) async {
    // ignore: prefer_const_declarations
    final path = r'/PassJourney/GetAllPassJourneys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    //final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final headers = {'Authorization': 'Bearer $token'};
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

  Future<List<PassJourney>?> passJourneyGetAllPassJourneysGet(
      String token) async {
    final response = await passJourneyGetAllPassJourneysGetWithHttpInfo(token);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(
              responseBody, 'List<PassJourney>') as List)
          .cast<PassJourney>()
          .toList();
    }
    return null;
  }

  /// Performs an HTTP 'PUT /PassJourney/UpdatePassJourney' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PassJourney] passJourney:
  Future<Response> passJourneyUpdatePassJourneyPutWithHttpInfo({
    PassJourney? passJourney,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/PassJourney/UpdatePassJourney';

    // ignore: prefer_final_locals
    Object? postBody = passJourney;

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
  /// * [PassJourney] passJourney:
  Future<bool?> passJourneyUpdatePassJourneyPut({
    PassJourney? passJourney,
  }) async {
    final response = await passJourneyUpdatePassJourneyPutWithHttpInfo(
      passJourney: passJourney,
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
