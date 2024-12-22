//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class ApiErrorResponse {
  /// Returns a new [ApiErrorResponse] instance.
  ApiErrorResponse({
    this.status,
    this.code,
    this.message,
    this.fieldErrors = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  List<ApiFieldError> fieldErrors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiErrorResponse &&
    other.status == status &&
    other.code == code &&
    other.message == message &&
    _deepEquality.equals(other.fieldErrors, fieldErrors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status == null ? 0 : status!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (fieldErrors.hashCode);

  @override
  String toString() => 'ApiErrorResponse[status=$status, code=$code, message=$message, fieldErrors=$fieldErrors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
      json[r'fieldErrors'] = this.fieldErrors;
    return json;
  }

  /// Returns a new [ApiErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ApiErrorResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ApiErrorResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiErrorResponse(
        status: mapValueOfType<int>(json, r'status'),
        code: mapValueOfType<String>(json, r'code'),
        message: mapValueOfType<String>(json, r'message'),
        fieldErrors: ApiFieldError.listFromJson(json[r'fieldErrors']),
      );
    }
    return null;
  }

  static List<ApiErrorResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApiErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiErrorResponse> mapFromJson(dynamic json) {
    final map = <String, ApiErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiErrorResponse-objects as value to a dart map
  static Map<String, List<ApiErrorResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ApiErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiErrorResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

