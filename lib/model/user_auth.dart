//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserAuth {
  /// Returns a new [UserAuth] instance.
  UserAuth({
    this.tenantId,
    this.userid,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role,
    this.jobId,
    this.dob,
    this.phone,
    this.isVerified,
  });

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
  String? userid;

  String? firstName;

  String? lastName;

  String? email;

  String? password;

  String? role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? jobId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? dob;

  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isVerified;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAuth &&
     other.tenantId == tenantId &&
     other.userid == userid &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.email == email &&
     other.password == password &&
     other.role == role &&
     other.jobId == jobId &&
     other.dob == dob &&
     other.phone == phone &&
     other.isVerified == isVerified;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (userid == null ? 0 : userid!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (role == null ? 0 : role!.hashCode) +
    (jobId == null ? 0 : jobId!.hashCode) +
    (dob == null ? 0 : dob!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (isVerified == null ? 0 : isVerified!.hashCode);

  @override
  String toString() => 'UserAuth[tenantId=$tenantId, userid=$userid, firstName=$firstName, lastName=$lastName, email=$email, password=$password, role=$role, jobId=$jobId, dob=$dob, phone=$phone, isVerified=$isVerified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.tenantId != null) {
      json[r'tenantId'] = this.tenantId;
    } else {
      json[r'tenantId'] = null;
    }
    if (this.userid != null) {
      json[r'userid'] = this.userid;
    } else {
      json[r'userid'] = null;
    }
    if (this.firstName != null) {
      json[r'firstName'] = this.firstName;
    } else {
      json[r'firstName'] = null;
    }
    if (this.lastName != null) {
      json[r'lastName'] = this.lastName;
    } else {
      json[r'lastName'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.jobId != null) {
      json[r'jobId'] = this.jobId;
    } else {
      json[r'jobId'] = null;
    }
    if (this.dob != null) {
      json[r'dob'] = this.dob!.toUtc().toIso8601String();
    } else {
      json[r'dob'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.isVerified != null) {
      json[r'isVerified'] = this.isVerified;
    } else {
      json[r'isVerified'] = null;
    }
    return json;
  }

  /// Returns a new [UserAuth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserAuth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserAuth[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserAuth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserAuth(
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        userid: mapValueOfType<String>(json, r'userid'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        email: mapValueOfType<String>(json, r'email'),
        password: mapValueOfType<String>(json, r'password'),
        role: mapValueOfType<String>(json, r'role'),
        jobId: mapValueOfType<int>(json, r'jobId'),
        dob: mapDateTime(json, r'dob', ''),
        phone: mapValueOfType<String>(json, r'phone'),
        isVerified: mapValueOfType<bool>(json, r'isVerified'),
      );
    }
    return null;
  }

  static List<UserAuth> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserAuth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserAuth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserAuth> mapFromJson(dynamic json) {
    final map = <String, UserAuth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserAuth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserAuth-objects as value to a dart map
  static Map<String, List<UserAuth>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserAuth>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserAuth.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

