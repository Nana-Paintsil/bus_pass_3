//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Tenant {
  /// Returns a new [Tenant] instance.
  Tenant({
    this.id,
    this.parentTenantId,
    this.shortName,
    this.fullName,
    this.hierarchyLevel,
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
  String? parentTenantId;

  String? shortName;

  String? fullName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hierarchyLevel;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Tenant &&
     other.id == id &&
     other.parentTenantId == parentTenantId &&
     other.shortName == shortName &&
     other.fullName == fullName &&
     other.hierarchyLevel == hierarchyLevel;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (parentTenantId == null ? 0 : parentTenantId!.hashCode) +
    (shortName == null ? 0 : shortName!.hashCode) +
    (fullName == null ? 0 : fullName!.hashCode) +
    (hierarchyLevel == null ? 0 : hierarchyLevel!.hashCode);

  @override
  String toString() => 'Tenant[id=$id, parentTenantId=$parentTenantId, shortName=$shortName, fullName=$fullName, hierarchyLevel=$hierarchyLevel]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.parentTenantId != null) {
      json[r'parentTenantId'] = this.parentTenantId;
    } else {
      json[r'parentTenantId'] = null;
    }
    if (this.shortName != null) {
      json[r'shortName'] = this.shortName;
    } else {
      json[r'shortName'] = null;
    }
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.hierarchyLevel != null) {
      json[r'hierarchyLevel'] = this.hierarchyLevel;
    } else {
      json[r'hierarchyLevel'] = null;
    }
    return json;
  }

  /// Returns a new [Tenant] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Tenant? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Tenant[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Tenant[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Tenant(
        id: mapValueOfType<String>(json, r'id'),
        parentTenantId: mapValueOfType<String>(json, r'parentTenantId'),
        shortName: mapValueOfType<String>(json, r'shortName'),
        fullName: mapValueOfType<String>(json, r'fullName'),
        hierarchyLevel: mapValueOfType<int>(json, r'hierarchyLevel'),
      );
    }
    return null;
  }

  static List<Tenant> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Tenant>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Tenant.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Tenant> mapFromJson(dynamic json) {
    final map = <String, Tenant>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Tenant.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Tenant-objects as value to a dart map
  static Map<String, List<Tenant>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Tenant>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Tenant.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

