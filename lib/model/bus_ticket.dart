//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BusTicket {
  /// Returns a new [BusTicket] instance.
  BusTicket({
    this.id,
    this.userId,
    this.tenantId,
    this.startingPoint,
    this.endingPoint,
    this.seatNo,
    this.dateOfPurchase,
    this.price,
    this.isActive,
    this.bus,
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
  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tenantId;

  String? startingPoint;

  String? endingPoint;

  String? seatNo;
  DateTime? dateOfPurchase;

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
  Bus? bus;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusTicket &&
          other.id == id &&
          other.userId == userId &&
          other.tenantId == tenantId &&
          other.startingPoint == startingPoint &&
          other.endingPoint == endingPoint &&
          other.seatNo == seatNo &&
          other.dateOfPurchase == dateOfPurchase &&
          other.price == price &&
          other.isActive == isActive &&
          other.bus == bus;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (userId == null ? 0 : userId!.hashCode) +
      (tenantId == null ? 0 : tenantId!.hashCode) +
      (startingPoint == null ? 0 : startingPoint!.hashCode) +
      (endingPoint == null ? 0 : endingPoint!.hashCode) +
      (seatNo == null ? 0 : seatNo!.hashCode) +
      (dateOfPurchase == null ? 0 : dateOfPurchase!.hashCode) +
      (price == null ? 0 : price!.hashCode) +
      (isActive == null ? 0 : isActive!.hashCode) +
      (bus == null ? 0 : bus!.hashCode);

  @override
  String toString() =>
      'BusTicket[id=$id, userId=$userId, tenantId=$tenantId, startingPoint=$startingPoint, endingPoint=$endingPoint, seatNo=$seatNo, price=$price, dateOfPurchase=$dateOfPurchase, isActive=$isActive, bus=$bus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
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
    if (this.startingPoint != null) {
      json[r'startingPoint'] = this.startingPoint;
    } else {
      json[r'startingPoint'] = null;
    }
    if (this.endingPoint != null) {
      json[r'endingPoint'] = this.endingPoint;
    } else {
      json[r'endingPoint'] = null;
    }
    if (this.seatNo != null) {
      json[r'seatNo'] = this.seatNo;
    } else {
      json[r'seatNo'] = null;
    }
    if (this.dateOfPurchase != null) {
      json[r'dateOfPurchase'] = this.dateOfPurchase!.toUtc().toIso8601String();
    } else {
      json[r'dateOfPurchase'] = null;
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
    if (this.bus != null) {
      json[r'bus'] = this.bus;
    } else {
      json[r'bus'] = null;
    }
    return json;
  }

  /// Returns a new [BusTicket] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BusTicket? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "BusTicket[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "BusTicket[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BusTicket(
        id: mapValueOfType<String>(json, r'id'),
        userId: mapValueOfType<String>(json, r'userId'),
        tenantId: mapValueOfType<String>(json, r'tenantId'),
        startingPoint: mapValueOfType<String>(json, r'startingPoint'),
        endingPoint: mapValueOfType<String>(json, r'endingPoint'),
        seatNo: mapValueOfType<String>(json, r'seatNo'),
        dateOfPurchase: mapDateTime(json, r'dateOfPurchase', ''),
        price: mapValueOfType<double>(json, r'price'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        bus: Bus.fromJson(json[r'bus']),
      );
    }
    return null;
  }

  static List<BusTicket> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BusTicket>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BusTicket.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BusTicket> mapFromJson(dynamic json) {
    final map = <String, BusTicket>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BusTicket.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BusTicket-objects as value to a dart map
  static Map<String, List<BusTicket>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<BusTicket>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BusTicket.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
