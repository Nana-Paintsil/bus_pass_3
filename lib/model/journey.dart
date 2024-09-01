//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Journey {
  /// Returns a new [Journey] instance.
  Journey({
    this.id,
    this.tenantId,
    this.startingPoint,
    this.destination,
    this.stops = const [],
    this.price,
    this.isActive,
    this.estimatedDuration,
    this.isDeleted,
    this.activeBus,
    this.busesInTransit = const [],
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
  double? price;

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
  TimeSpan? estimatedDuration;

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
  Bus? activeBus;

  List<Bus>? busesInTransit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Journey &&
     other.id == id &&
     other.tenantId == tenantId &&
     other.startingPoint == startingPoint &&
     other.destination == destination &&
     other.stops == stops &&
     other.price == price &&
     other.isActive == isActive &&
     other.estimatedDuration == estimatedDuration &&
     other.isDeleted == isDeleted &&
     other.activeBus == activeBus &&
     other.busesInTransit == busesInTransit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (tenantId == null ? 0 : tenantId!.hashCode) +
    (startingPoint == null ? 0 : startingPoint!.hashCode) +
    (destination == null ? 0 : destination!.hashCode) +
    (stops == null ? 0 : stops!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (estimatedDuration == null ? 0 : estimatedDuration!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (activeBus == null ? 0 : activeBus!.hashCode) +
    (busesInTransit == null ? 0 : busesInTransit!.hashCode);

  @override
  String toString() => 'Journey[id=$id, tenantId=$tenantId, startingPoint=$startingPoint, destination=$destination, stops=$stops, price=$price, isActive=$isActive, estimatedDuration=$estimatedDuration, isDeleted=$isDeleted, activeBus=$activeBus, busesInTransit=$busesInTransit]';

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
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.isActive != null) {
      json[r'isActive'] = this.isActive;
    } else {
      json[r'isActive'] = null;
    }
    if (this.estimatedDuration != null) {
      json[r'estimatedDuration'] = this.estimatedDuration;
    } else {
      json[r'estimatedDuration'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
    }
    if (this.activeBus != null) {
      json[r'activeBus'] = this.activeBus;
    } else {
      json[r'activeBus'] = null;
    }
    if (this.busesInTransit != null) {
      json[r'busesInTransit'] = this.busesInTransit;
    } else {
      json[r'busesInTransit'] = null;
    }
    return json;
  }

  /// Returns a new [Journey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Journey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Journey[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Journey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Journey(
        id: mapValueOfType<String>(json, r'id'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        startingPoint: mapValueOfType<String>(json, r'startingPoint'),
        destination: mapValueOfType<String>(json, r'destination'),
        stops: Stop.listFromJson(json[r'stops']),
        price: mapValueOfType<double>(json, r'price'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        estimatedDuration: TimeSpan.fromJson(json[r'estimatedDuration']),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        activeBus: Bus.fromJson(json[r'activeBus']),
        busesInTransit: Bus.listFromJson(json[r'busesInTransit']),
      );
    }
    return null;
  }

  static List<Journey> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Journey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Journey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Journey> mapFromJson(dynamic json) {
    final map = <String, Journey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Journey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Journey-objects as value to a dart map
  static Map<String, List<Journey>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Journey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Journey.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

