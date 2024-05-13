import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SmartHomeModel extends ChangeNotifier {
  String roomName;
  String roomImage;
  String roomTemperature;
  String roomHuminity;
  int userAccess;
  bool roomStatus;
  List<DeviceInRoom>? devices;
  SmartHomeModel({
    required this.roomName,
    required this.roomImage,
    required this.roomTemperature,
    required this.roomHuminity,
    required this.userAccess,
    this.roomStatus = false,
    this.devices,
  });

  PanelController pc = PanelController();
  bool isACon = true;
  final List<bool> isSelected = [true, false, false, false];
  double timerHours = 8;

  void acSwitch(bool value) {
    isACon = value;
    notifyListeners();
  }

  void onToggleTapped(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    notifyListeners();
  }

  void changeTimerHours(double newval) {
    timerHours = newval;
    notifyListeners();
  }
}

class DeviceInRoom {
  String deviceName;
  IconData iconOn;
  IconData iconOff;
  bool deviceStatus;
  DeviceInRoom({
    required this.deviceName,
    required this.iconOn,
    required this.iconOff,
    this.deviceStatus = false,
  });
}



List<SmartHomeModel> smartHomeData = [
  SmartHomeModel(
    roomName: "Living Room",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 4,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Home Theater",
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Master Bedroom",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 1,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Home Theater",
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Dining Room",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 4,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Kitchen",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 2,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Chimney",
        iconOn: Icons.air,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fridge",
        iconOn: Icons.kitchen,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Microwave",
        iconOn: Icons.microwave,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Grinder",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Induction",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Coffee Maker",
        iconOn: Icons.coffee_maker_outlined,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Kid's Bedroom",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 2,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Home Office",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 1,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Guest Room",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 1,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Garage",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 1,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Laundry Room",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 4,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Water Pump",
        iconOn: Icons.water_drop,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Washing Machine",
        iconOn: Icons.local_laundry_service,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Bathroom",
    roomImage: "assets/images/living_room.jpg",
    roomTemperature: "25°",
    roomHuminity: "20%",
    userAccess: 3,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Geysers",
        iconOn: Icons.water_drop,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
    ],
  ),
];