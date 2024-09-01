//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Bus {
  /// Returns a new [Bus] instance.
  Bus({
    this.id,
    this.tenantId,
    this.regNo,
    this.inTransit,
    this.isActive,
    this.stops = const [],
    this.isBeingLoaded,
    this.currentCapacity,
    this.maxCapacity,
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

  String? regNo;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? inTransit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isActive;

  List<Stop>? stops;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isBeingLoaded;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentCapacity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxCapacity;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Bus &&
     other.id == id &&
     other.tenantId == tenantId &&
     other.regNo == regNo &&
     other.inTransit == inTransit &&
     other.isActive == isActive &&
     other.stops == stops &&
     other.isBeingLoaded == isBeingLoaded &&
     other.currentCapacity == currentCapacity &&
     other.maxCapacity == maxCapacity;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (regNo == null ? 0 : regNo!.hashCode) +
    (inTransit == null ? 0 : inTransit!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (stops == null ? 0 : stops!.hashCode) +
    (isBeingLoaded == null ? 0 : isBeingLoaded!.hashCode) +
    (currentCapacity == null ? 0 : currentCapacity!.hashCode) +
    (maxCapacity == null ? 0 : maxCapacity!.hashCode);

  @override
  String toString() => 'Bus[id=$id, tenantId=$tenantId, regNo=$regNo, inTransit=$inTransit, isActive=$isActive, stops=$stops, isBeingLoaded=$isBeingLoaded, currentCapacity=$currentCapacity, maxCapacity=$maxCapacity]';

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
    if (this.regNo != null) {
      json[r'regNo'] = this.regNo;
    } else {
      json[r'regNo'] = null;
    }
    if (this.inTransit != null) {
      json[r'inTransit'] = this.inTransit;
    } else {
      json[r'inTransit'] = null;
    }
    if (this.isActive != null) {
      json[r'isActive'] = this.isActive;
    } else {
      json[r'isActive'] = null;
    }
    if (this.stops != null) {
      json[r'stops'] = this.stops;
    } else {
      json[r'stops'] = null;
    }
    if (this.isBeingLoaded != null) {
      json[r'isBeingLoaded'] = this.isBeingLoaded;
    } else {
      json[r'isBeingLoaded'] = null;
    }
    if (this.currentCapacity != null) {
      json[r'currentCapacity'] = this.currentCapacity;
    } else {
      json[r'currentCapacity'] = null;
    }
    if (this.maxCapacity != null) {
      json[r'maxCapacity'] = this.maxCapacity;
    } else {
      json[r'maxCapacity'] = null;
    }
    return json;
  }

  /// Returns a new [Bus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Bus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Bus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Bus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Bus(
        id: mapValueOfType<String>(json, r'id'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        regNo: mapValueOfType<String>(json, r'regNo'),
        inTransit: mapValueOfType<bool>(json, r'inTransit'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        stops: Stop.listFromJson(json[r'stops']),
        isBeingLoaded: mapValueOfType<bool>(json, r'isBeingLoaded'),
        currentCapacity: mapValueOfType<int>(json, r'currentCapacity'),
        maxCapacity: mapValueOfType<int>(json, r'maxCapacity'),
      );
    }
    return null;
  }

  static List<Bus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Bus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Bus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Bus> mapFromJson(dynamic json) {
    final map = <String, Bus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Bus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Bus-objects as value to a dart map
  static Map<String, List<Bus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Bus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Bus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

