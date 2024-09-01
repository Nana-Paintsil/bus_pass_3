//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /User/Authenticate' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserCred] userCred:
  Future<Response> userAuthenticatePostWithHttpInfo({ UserCred? userCred, }) async {
    // ignore: prefer_const_declarations
    final path = r'/User/Authenticate';

    // ignore: prefer_final_locals
    Object? postBody = userCred;

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
  /// * [UserCred] userCred:
  Future<TokenResponse?> userAuthenticatePost({ UserCred? userCred, }) async {
    final response = await userAuthenticatePostWithHttpInfo( userCred: userCred, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenResponse',) as TokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /User/GetAllUsers' operation and returns the [Response].
  Future<Response> userGetAllUsersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/User/GetAllUsers';

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

  Future<List<TblUser>?> userGetAllUsersGet() async {
    final response = await userGetAllUsersGetWithHttpInfo();
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

  /// Performs an HTTP 'POST /User/NewUser' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserAuth] userAuth:
  Future<Response> userNewUserPostWithHttpInfo({ UserAuth? userAuth, }) async {
    // ignore: prefer_const_declarations
    final path = r'/User/NewUser';

    // ignore: prefer_final_locals
    Object? postBody = userAuth;

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
  /// * [UserAuth] userAuth:
  Future<bool?> userNewUserPost({ UserAuth? userAuth, }) async {
    final response = await userNewUserPostWithHttpInfo( userAuth: userAuth, );
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

  /// Performs an HTTP 'POST /User/RefToken' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [TokenResponse] tokenResponse:
  Future<Response> userRefTokenPostWithHttpInfo({ TokenResponse? tokenResponse, }) async {
    // ignore: prefer_const_declarations
    final path = r'/User/RefToken';

    // ignore: prefer_final_locals
    Object? postBody = tokenResponse;

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
  /// * [TokenResponse] tokenResponse:
  Future<TokenResponse?> userRefTokenPost({ TokenResponse? tokenResponse, }) async {
    final response = await userRefTokenPostWithHttpInfo( tokenResponse: tokenResponse, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenResponse',) as TokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /User/UserProfile' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId:
  Future<Response> userUserProfileGetWithHttpInfo({ String? userId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/User/UserProfile';

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
  Future<TblUser?> userUserProfileGet({ String? userId, }) async {
    final response = await userUserProfileGetWithHttpInfo( userId: userId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TblUser',) as TblUser;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /User/VerifyUser' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] body:
  Future<Response> userVerifyUserPutWithHttpInfo({ String? body, }) async {
    // ignore: prefer_const_declarations
    final path = r'/User/VerifyUser';

    // ignore: prefer_final_locals
    Object? postBody = body;

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
  /// * [String] body:
  Future<bool?> userVerifyUserPut({ String? body, }) async {
    final response = await userVerifyUserPutWithHttpInfo( body: body, );
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
