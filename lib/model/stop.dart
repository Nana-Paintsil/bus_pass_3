//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Stop {
  /// Returns a new [Stop] instance.
  Stop({
    this.id,
    this.tenantId,
    this.isActive,
    this.name,
    this.latitude,
    this.longitude,
    this.departureTime,
    this.expectedArrivalTime,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

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
  bool? isActive;

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? latitude;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? longitude;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? departureTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? expectedArrivalTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stop &&
     other.id == id &&
     other.tenantId == tenantId &&
     other.isActive == isActive &&
     other.name == name &&
     other.latitude == latitude &&
     other.longitude == longitude &&
     other.departureTime == departureTime &&
     other.expectedArrivalTime == expectedArrivalTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode) +
    (departureTime == null ? 0 : departureTime!.hashCode) +
    (expectedArrivalTime == null ? 0 : expectedArrivalTime!.hashCode);

  @override
  String toString() => 'Stop[id=$id, tenantId=$tenantId, isActive=$isActive, name=$name, latitude=$latitude, longitude=$longitude, departureTime=$departureTime, expectedArrivalTime=$expectedArrivalTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.tenantId != null) {
      json[r'tenantId'] = this.tenantId;
    } else {
      json[r'tenantId'] = null;
    }
    if (this.isActive != null) {
      json[r'isActive'] = this.isActive;
    } else {
      json[r'isActive'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.latitude != null) {
      json[r'latitude'] = this.latitude;
    } else {
      json[r'latitude'] = null;
    }
    if (this.longitude != null) {
      json[r'longitude'] = this.longitude;
    } else {
      json[r'longitude'] = null;
    }
    if (this.departureTime != null) {
      json[r'departureTime'] = this.departureTime!.toUtc().toIso8601String();
    } else {
      json[r'departureTime'] = null;
    }
    if (this.expectedArrivalTime != null) {
      json[r'expectedArrivalTime'] = this.expectedArrivalTime!.toUtc().toIso8601String();
    } else {
      json[r'expectedArrivalTime'] = null;
    }
    return json;
  }

  /// Returns a new [Stop] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Stop? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Stop[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Stop[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Stop(
        id: mapValueOfType<String>(json, r'id'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        name: mapValueOfType<String>(json, r'name'),
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
        departureTime: mapDateTime(json, r'departureTime', ''),
        expectedArrivalTime: mapDateTime(json, r'expectedArrivalTime', ''),
      );
    }
    return null;
  }

  static List<Stop> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Stop>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Stop.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Stop> mapFromJson(dynamic json) {
    final map = <String, Stop>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Stop.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Stop-objects as value to a dart map
  static Map<String, List<Stop>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Stop>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Stop.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

