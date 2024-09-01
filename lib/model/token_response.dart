//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TokenResponse {
  /// Returns a new [TokenResponse] instance.
  TokenResponse({
    this.jwttoken,
    this.refreshtoken,
    this.userId,
    this.tenantId,
    this.expirytime,
  });

  String? jwttoken;

  String? refreshtoken;

  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tenantId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? expirytime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenResponse &&
     other.jwttoken == jwttoken &&
     other.refreshtoken == refreshtoken &&
     other.userId == userId &&
     other.tenantId == tenantId &&
     other.expirytime == expirytime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (jwttoken == null ? 0 : jwttoken!.hashCode) +
    (refreshtoken == null ? 0 : refreshtoken!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (expirytime == null ? 0 : expirytime!.hashCode);

  @override
  String toString() => 'TokenResponse[jwttoken=$jwttoken, refreshtoken=$refreshtoken, userId=$userId, tenantId=$tenantId, expirytime=$expirytime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.jwttoken != null) {
      json[r'jwttoken'] = this.jwttoken;
    } else {
      json[r'jwttoken'] = null;
    }
    if (this.refreshtoken != null) {
      json[r'refreshtoken'] = this.refreshtoken;
    } else {
      json[r'refreshtoken'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.tenantId != null) {
      json[r'tenantId'] = this.tenantId;
    } else {
      json[r'tenantId'] = null;
    }
    if (this.expirytime != null) {
      json[r'expirytime'] = this.expirytime!.toUtc().toIso8601String();
    } else {
      json[r'expirytime'] = null;
    }
    return json;
  }

  /// Returns a new [TokenResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TokenResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TokenResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TokenResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TokenResponse(
        jwttoken: mapValueOfType<String>(json, r'jwttoken'),
        refreshtoken: mapValueOfType<String>(json, r'refreshtoken'),
        userId: mapValueOfType<String>(json, r'userId'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        expirytime: mapDateTime(json, r'expirytime', ''),
      );
    }
    return null;
  }

  static List<TokenResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TokenResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TokenResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TokenResponse> mapFromJson(dynamic json) {
    final map = <String, TokenResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TokenResponse-objects as value to a dart map
  static Map<String, List<TokenResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TokenResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TokenResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

