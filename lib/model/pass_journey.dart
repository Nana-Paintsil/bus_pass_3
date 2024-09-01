//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PassJourney {
  /// Returns a new [PassJourney] instance.
  PassJourney({
    this.id,
    this.tenantId,
    this.startingPoint,
    this.destination,
    this.stops = const [],
    this.dailyPrice,
    this.monthlyPrice,
    this.weeklyPrice,
    this.isActive,
    this.isDeleted,
    this.latitude,
    this.longitude,
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

  String? startingPoint;

  String? destination;

  List<Stop>? stops;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? dailyPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? monthlyPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? weeklyPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isActive;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDeleted;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is PassJourney &&
     other.id == id &&
     other.tenantId == tenantId &&
     other.startingPoint == startingPoint &&
     other.destination == destination &&
     other.stops == stops &&
     other.dailyPrice == dailyPrice &&
     other.monthlyPrice == monthlyPrice &&
     other.weeklyPrice == weeklyPrice &&
     other.isActive == isActive &&
     other.isDeleted == isDeleted &&
     other.latitude == latitude &&
     other.longitude == longitude;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (startingPoint == null ? 0 : startingPoint!.hashCode) +
    (destination == null ? 0 : destination!.hashCode) +
    (stops == null ? 0 : stops!.hashCode) +
    (dailyPrice == null ? 0 : dailyPrice!.hashCode) +
    (monthlyPrice == null ? 0 : monthlyPrice!.hashCode) +
    (weeklyPrice == null ? 0 : weeklyPrice!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode);

  @override
  String toString() => 'PassJourney[id=$id, tenantId=$tenantId, startingPoint=$startingPoint, destination=$destination, stops=$stops, dailyPrice=$dailyPrice, monthlyPrice=$monthlyPrice, weeklyPrice=$weeklyPrice, isActive=$isActive, isDeleted=$isDeleted, latitude=$latitude, longitude=$longitude]';

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
    if (this.startingPoint != null) {
      json[r'startingPoint'] = this.startingPoint;
    } else {
      json[r'startingPoint'] = null;
    }
    if (this.destination != null) {
      json[r'destination'] = this.destination;
    } else {
      json[r'destination'] = null;
    }
    if (this.stops != null) {
      json[r'stops'] = this.stops;
    } else {
      json[r'stops'] = null;
    }
    if (this.dailyPrice != null) {
      json[r'dailyPrice'] = this.dailyPrice;
    } else {
      json[r'dailyPrice'] = null;
    }
    if (this.monthlyPrice != null) {
      json[r'monthlyPrice'] = this.monthlyPrice;
    } else {
      json[r'monthlyPrice'] = null;
    }
    if (this.weeklyPrice != null) {
      json[r'weeklyPrice'] = this.weeklyPrice;
    } else {
      json[r'weeklyPrice'] = null;
    }
    if (this.isActive != null) {
      json[r'isActive'] = this.isActive;
    } else {
      json[r'isActive'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
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
    return json;
  }

  /// Returns a new [PassJourney] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PassJourney? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PassJourney[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PassJourney[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PassJourney(
        id: mapValueOfType<String>(json, r'id'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        startingPoint: mapValueOfType<String>(json, r'startingPoint'),
        destination: mapValueOfType<String>(json, r'destination'),
        stops: Stop.listFromJson(json[r'stops']),
        dailyPrice: mapValueOfType<double>(json, r'dailyPrice'),
        monthlyPrice: mapValueOfType<double>(json, r'monthlyPrice'),
        weeklyPrice: mapValueOfType<double>(json, r'weeklyPrice'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
      );
    }
    return null;
  }

  static List<PassJourney> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PassJourney>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PassJourney.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PassJourney> mapFromJson(dynamic json) {
    final map = <String, PassJourney>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PassJourney.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PassJourney-objects as value to a dart map
  static Map<String, List<PassJourney>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PassJourney>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PassJourney.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

