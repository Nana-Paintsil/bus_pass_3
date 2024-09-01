import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sensors/sensors.dart';

import '../Models/Scoped_Model.dart';
import '../api.dart';

// ignore: must_be_immutable
class MapPage extends StatefulWidget {
  List<Stop> allStops;
  MapPage(this.allStops);
  @override
  State<StatefulWidget> createState() {
    return MapState(allStops);
  }
}

class MapState extends State<MapPage> {
  List<Stop> allStops;
  MapState(this.allStops);
  final Set<Marker> _markers = {};
  Location location = new Location();
  bool isBusy = false;
  LocationData? currentLocation;

  StreamSubscription<GyroscopeEvent>? gyroscopeSubscription;
  StreamSubscription<LocationData>? locationSubscription;
  List<Stop> _filteredBuses = [];
  double heading = 0;
  late GoogleMapController _mapController;

  @override
  void initState() {
    setState(() {
      isBusy = true;
    });
    _getPermissions().then((value) {
      loadCustomMarkers().then((value) {
        GetLocation().then((value) {
          currentLocation = value;

          setState(() {
            isBusy = false;
          });
        });
      });
    });
    super.initState();
  }

  // ignore: unused_element
  void _startListeningToOrientation() {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == AppLifecycleState.resumed.toString()) {
        _listenToOrientation();
      }
      return Future.value("");
    });
  }

  void _listenToOrientation() {
    gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        heading = event.z;
      });
      _updateMapCameraPosition();
    });
  }

  // ignore: unused_element
  void _startListeningToLocation() {
    locationSubscription =
        Location().onLocationChanged.listen((LocationData newLoc) {
      setState(() {
        currentLocation = newLoc;
      });
      _updateMapCameraPosition();
    });
  }

  void _updateMapCameraPosition() {
    if (currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            bearing: heading,
            zoom: 16.0,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    gyroscopeSubscription?.cancel();
    locationSubscription?.cancel();
    super.dispose();
  }

  BitmapDescriptor? locationIcon;
  BitmapDescriptor? busIcon;

  Future<void> loadCustomMarkers() async {
    locationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(10, 10)),
      'assets/images/location_circle4.png',
    );
    busIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(10, 10)),
      'assets/images/bus_icon3.png',
    );
  }

  Future<LocationData> GetLocation() async {
    var locationData = await location.getLocation();
    return locationData;
  }

  Future<void> _getPermissions() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
  }

  void _filterBuses(String keyword) {
    setState(() {
      if (keyword == "") {
        _filteredBuses = [];
      } else {
        _filteredBuses = allStops
            .where((stop) => stop.name
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<MyScopedModel>(context);
    if (currentLocation != null) {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId('loc'),
            position: LatLng(
              currentLocation!.latitude!.toDouble(),
              currentLocation!.longitude!.toDouble(),
            ),
            icon: locationIcon!,
            infoWindow: InfoWindow(title: "Location"),
            rotation: heading),
      );

      allStops.forEach((element) {
        _markers.add(
          Marker(
            markerId: MarkerId(element.name.toString()),
            position: LatLng(element.latitude!, element.longitude!),
            icon: busIcon!,
            infoWindow: InfoWindow(title: element.name.toString()),
          ),
        );
      });
    }

    return isBusy == true
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.purple.shade400, // Set the background color
            child: Center(
              child: CircularProgressIndicator(
                // Customize CircularProgressIndicator properties here
                valueColor: AlwaysStoppedAnimation<Color>(model.myColor),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 2,
              backgroundColor: Colors.purple.shade400.withOpacity(0.7),
              title: Text(
                'Map View',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Colors.white), // Add the back icon
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: GoogleMap(
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        new Factory<OneSequenceGestureRecognizer>(
                          () => new EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          currentLocation!.latitude!,
                          currentLocation!.longitude!,
                        ),
                        zoom: 16.0,
                      ),
                      markers: _markers,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          model.primary,
                          model.primary
                        ], // Use the same color twice for a sharp line
                        begin: Alignment.topCenter,
                        stops: [0.5, 0.5],
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: model.seconday,
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: TextFormField(
                        onChanged: _filterBuses,
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          iconColor: Colors.black,
                          hintText: 'Jump To',
                        ),
                      ),
                    )),
                Container(
                    color: Colors
                        .grey[200], // Set the background color for ListView
                    child: Card(
                        elevation: 4.0, // Add elevation for card effect
                        // margin: EdgeInsets.all(3.0),
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _filteredBuses.length,
                            itemBuilder: (context, index) {
                              final busStop = allStops[index];

                              return Column(children: [
                                Container(
                                    height: 40,
                                    child: ListTile(
                                      title: Text(busStop.name.toString()),
                                      onTap: () {
                                        _onBusStopSelected(busStop);
                                      },
                                    )),
                                Divider(
                                  thickness: 2,
                                )
                              ]);
                            },
                          ),
                        ))),
              ],
            ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    //  _startListeningToOrientation();
    //_startListeningToLocation();
  }

  void _onBusStopSelected(Stop busStop) {
    Marker? selectedMarker;

    for (final marker in _markers) {
      if (marker.markerId.value == busStop.name.toString()) {
        selectedMarker = marker;
        break;
      }
    }

    if (selectedMarker != null) {
      _mapController
          .animateCamera(CameraUpdate.newLatLng(selectedMarker.position));
    }
  }
}
