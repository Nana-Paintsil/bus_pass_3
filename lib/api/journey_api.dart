//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JourneyApi {
  JourneyApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /Journey/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Journey] journey:
  Future<Response> journeyAddPostWithHttpInfo({
    Journey? journey,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/Journey/Add';

    // ignore: prefer_final_locals
    Object? postBody = journey;

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
  /// * [Journey] journey:
  Future<bool?> journeyAddPost({
    Journey? journey,
  }) async {
    final response = await journeyAddPostWithHttpInfo(
      journey: journey,
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

  /// Performs an HTTP 'GET /Journey/GetAllJourneys' operation and returns the [Response].
  Future<Response> journeyGetAllJourneysGetWithHttpInfo(String token) async {
    // ignore: prefer_const_declarations
    final path = r'/Journey/GetAllJourneys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    //final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    final headers = {'Authorization': 'Bearer $token'};
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

  Future<List<Journey>?> journeyGetAllJourneysGet(String token) async {
    final response = await journeyGetAllJourneysGetWithHttpInfo(token);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Journey>')
              as List)
          .cast<Journey>()
          .toList();
    }
    return null;
  }

  /// Performs an HTTP 'GET /Journey/GetUpdatedJourneyDetails' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] guid:
  Future<Response> journeyGetUpdatedJourneyDetailsGetWithHttpInfo({
    String? guid,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/Journey/GetUpdatedJourneyDetails';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (guid != null) {
      queryParams.addAll(_queryParams('', 'guid', guid));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] guid:
  Future<Journey?> journeyGetUpdatedJourneyDetailsGet({
    String? guid,
  }) async {
    final response = await journeyGetUpdatedJourneyDetailsGetWithHttpInfo(
      guid: guid,
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
        'Journey',
      ) as Journey;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /Journey/UpdateJourney' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Journey] journey:
  Future<Response> journeyUpdateJourneyPutWithHttpInfo({
    Journey? journey,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/Journey/UpdateJourney';

    // ignore: prefer_final_locals
    Object? postBody = journey;

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
  /// * [Journey] journey:
  Future<bool?> journeyUpdateJourneyPut({
    Journey? journey,
  }) async {
    final response = await journeyUpdateJourneyPutWithHttpInfo(
      journey: journey,
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
