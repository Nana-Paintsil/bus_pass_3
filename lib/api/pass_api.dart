//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PassApi {
  PassApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /Pass/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Pass] pass:
  Future<Response> passAddPostWithHttpInfo({ Pass? pass, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pass/Add';

    // ignore: prefer_final_locals
    Object? postBody = pass;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


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
  /// * [Pass] pass:
  Future<bool?> passAddPost({ Pass? pass, }) async {
    final response = await passAddPostWithHttpInfo( pass: pass, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'bool',) as bool;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Pass/GetSubscribedUsers' operation and returns the [Response].
  Future<Response> passGetSubscribedUsersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Pass/GetSubscribedUsers';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  Future<List<TblUser>?> passGetSubscribedUsersGet() async {
    final response = await passGetSubscribedUsersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<TblUser>') as List)
        .cast<TblUser>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'GET /Pass/GetUserPasses' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId:
  Future<Response> passGetUserPassesGetWithHttpInfo({ String? userId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pass/GetUserPasses';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (userId != null) {
      queryParams.addAll(_queryParams('', 'userId', userId));
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
  /// * [String] userId:
  Future<List<Pass>?> passGetUserPassesGet({ String? userId, }) async {
    final response = await passGetUserPassesGetWithHttpInfo( userId: userId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Pass>') as List)
        .cast<Pass>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'PUT /Pass/UpdatePass' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Pass] pass:
  Future<Response> passUpdatePassPutWithHttpInfo({ Pass? pass, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pass/UpdatePass';

    // ignore: prefer_final_locals
    Object? postBody = pass;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


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
  /// * [Pass] pass:
  Future<bool?> passUpdatePassPut({ Pass? pass, }) async {
    final response = await passUpdatePassPutWithHttpInfo( pass: pass, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'bool',) as bool;
    
    }
    return null;
  }
}
