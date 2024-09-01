import 'dart:convert';

import 'package:bus_pass_3/Pages/Main_Pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';
import '../Pages/Main_Pages/BusManagement.dart';
import '../api.dart';
import 'package:http/http.dart' as http;

class MyScopedModel extends Model {
  String userId = "";
  String tenantId = "";
  List<Pass> userPasses = [];
  List<BusTicket> userTickets = [];
  Location location = new Location();
  List<Bus> buses = [];
  List<Journey> allJourneys = [];
  List<Tenant> allTenants = [];
  TblUser? authenticatedUser;
  String? token;
  List<PassJourney> allPassJourneys = [];
  bool isAuthenticated = false;
  Color primary = Color(0xFFE7ECF0);
  Color seconday = Color(0xFFFFFCFC); //#5a3dff
  Color myColor = Colors.purple.shade400;
  String? userEmail;
  BusesApi busesApi = BusesApi();
  PassApi passesApi = PassApi();
  BusTicketApi busticketApi = BusTicketApi();
  TenantsApi tenantsApi = TenantsApi();
  PassJourneyApi passJourneyApi = PassJourneyApi();
  StopsApi stopsApi = StopsApi();
  JourneyApi journeyApi = JourneyApi();
  PassJourneyApi subscriptionsApi = PassJourneyApi();
  ApiClient apiClient = ApiClient();
  UserApi usersApi = UserApi();

  void addToUserPasses(Pass pass) {
    userPasses.add(pass);
  }

  Future<bool> Authenticate(UserCred userCred) async {
    try {
      var result1 = await usersApi.userAuthenticatePost(userCred: userCred);
      if (result1 != null) {
        userId = result1.userId.toString();
      }
      isAuthenticated = true;
      userEmail = userCred.email;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Journey> fetchJourneyDetails(String guid) async {
    final response = await http.get(
      Uri.parse(
          'https://buspassapi.azurewebsites.net/Journey/GetUpdatedJourneyDetails?guid=$guid'),
      headers: {'accept': 'text/plain', 'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      // Assuming your response is in JSON format
      // Modify this part to parse your response accordingly
      final jsonResponse = response.body;
      var response1 = json.decode(jsonResponse);
      try {
        Journey journey = Journey.fromJson(response1)!;

        return journey;
      } catch (ex) {}
    } else {
      throw Exception('Failed to fetch journey details');
    }
    Journey journ = Journey();
    return journ;
  }

  Future<void> fetchUserProfile() async {
    final response = await http.get(
      Uri.parse(
          'https://buspassapi.azurewebsites.net/User/UserProfile?userId=$userId'),
    );

    if (response.statusCode == 200) {
      // Assuming your response is in JSON format
      // Modify this part to parse your response accordingly
      final jsonResponse = response.body;

      var jsonResponse1 = json.decode(jsonResponse);
      try {
        TblUser tblUser = TblUser.fromJson(jsonResponse1)!;
        authenticatedUser = tblUser;
      } catch (ex) {}
    } else {
      throw Exception('Failed to fetch journey details');
    }
  }

  String formatToGhsCurrency(double amount) {
    final formatCurrency =
        NumberFormat.currency(locale: 'en_GH', symbol: 'GH¢');
    return formatCurrency.format(amount);
  }

  Future<List<Pass>> fetchUserPasses() async {
    final response = await http.get(
      Uri.parse(
          'https://buspassapi.azurewebsites.net/Pass/GetUserPasses?userId=$userId'),
      headers: {'accept': 'text/plain'},
    );

    if (response.statusCode == 200) {
      // Assuming your response is in JSON format
      // Modify this part to parse your response accordingly
      final jsonResponse = response.body;
      var jsonResponse1 = json.decode(jsonResponse);
      try {
        List<Pass> journey = Pass.listFromJson(jsonResponse1);
        return journey;
        /* return (await apiClient.deserializeAsync(jsonResponse1, 'List<Pass>')
                as List)
            .cast<Pass>()
            .toList();
            */
      } catch (ex) {
        throw Exception('Failed to fetch journey details');
      }
    } else {
      throw Exception('Failed to fetch journey details');
    }
    List<Pass> empty = [];
    return empty;
  }

  String generateGuid() {
    var uuid = Uuid();
    return uuid.v4();
  }

  Future<LocationData> GetLocation() async {
    var result = await location.getLocation();
    return result;
  }

  String convertToFormattedDuration(TimeSpan duration) {
    final formattedDuration =
        '${duration.hours.toString().padLeft(2, '0')}:${duration.minutes.toString().padLeft(2, '0')}:${duration.seconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }

  Future<bool> authenticateThenNavigate(
      UserCred userCred, BuildContext context) async {
    try {
      await usersApi
          .userAuthenticatePost(
        userCred:
            UserCred(email: userCred.email!, password: userCred.password!),
      )
          .then((value1) async {
        userId = value1!.userId.toString();
        userEmail = userCred.email;
        await fetchUserProfile().then((value) async {
          // ScopedModel.of<MyScopedModel>(context).authenticatedUser = value;

          await journeyApi
              .journeyGetAllJourneysGet(value1.jwttoken.toString())
              .then((value) {
            token = value1.jwttoken.toString();
            userId = value1.userId.toString();
            tenantId = value1.tenantId.toString();
            allJourneys = value!;
          });
        });
      });
      if (authenticatedUser!.role == "manager" ||
          authenticatedUser!.role == "admin") {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => JourneyScreen())));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      }
      return true;
    } catch (ex) {
      return false;
    }
  }

  String valueToCurrency(double amount) {
    MoneyFormatter fmf = MoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
          symbol: 'GH¢',
          thousandSeparator: ',',
        ));
    return fmf.output.symbolOnLeft;
  }

  Future<bool> updateJourney(Journey journey) async {
    final String apiUrl =
        'https://buspassapi.azurewebsites.net/Journey/UpdateJourney';

    final headers = {
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> jsonData = {
      "id": journey.id,
      "tenantId": journey.tenantId,
      "startingPoint": journey.startingPoint,
      "destination": journey.destination,
      "stops": journey.stops,
      "price": journey.price,
      "isActive": journey.isActive,
      "estimatedDuration":
          convertToFormattedDuration(journey.estimatedDuration!),
      "isDeleted": journey.isDeleted,
      "activeBus": journey.activeBus,
      "busesInTransit": journey.busesInTransit,
    };

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(jsonData),
    );

    return response.statusCode == 200;
  }
}
