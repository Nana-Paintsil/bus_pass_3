//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/bus_ticket_api.dart';
part 'api/buses_api.dart';
part 'api/journey_api.dart';
part 'api/pass_api.dart';
part 'api/pass_journey_api.dart';
part 'api/stops_api.dart';
part 'api/tenants_api.dart';
part 'api/user_api.dart';

part 'model/bus.dart';
part 'model/bus_ticket.dart';
part 'model/journey.dart';
part 'model/pass.dart';
part 'model/pass_journey.dart';
part 'model/stop.dart';
part 'model/tbl_user.dart';
part 'model/tenant.dart';
part 'model/time_span.dart';
part 'model/token_response.dart';
part 'model/user_auth.dart';
part 'model/user_cred.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
