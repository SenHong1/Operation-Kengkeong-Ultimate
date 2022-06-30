// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ok_upp/adminpage.dart';
import 'package:ok_upp/main.dart';

class Emergency_Request_Page extends StatefulWidget {
  const Emergency_Request_Page({Key? key}) : super(key: key);

  @override
  State<Emergency_Request_Page> createState() => _Emergency_Request_PageState();
}

class _Emergency_Request_PageState extends State<Emergency_Request_Page> {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  String ycurrFloorv = '?';
  List<String> ycurrFloor = ['1', '2', '3'];

  Future<void> alertAdminRequest() async {
    print("initializing...");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alert_notification',
      'alert_notification',
      channelDescription: 'This is the alert notification for the lift management system',
      icon: 'app_logo',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(
          threadIdentifier: "operation_oku",
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'ALERT: Emergency Request',
        'A lift user have sent an EMERGENCY REQUEST!', platformChannelSpecifics,
        payload: 'Emergency alert');
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Lift A Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        height: 45,
        width: size.width * .90,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.search,
              color: Colors.black26,
            ),
            Container(
              width: 10,
            ),
            const Expanded(
              flex: 6,
              child: Text(
                'Choose your Target floor',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: DropdownButton<String>(
                value: null,
                elevation: 16,
                icon: const Icon(FontAwesomeIcons.chevronCircleDown),
                items: ycurrFloor.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontFamily: "News705",
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    ycurrFloorv = newValue!;
                    // print(newValue);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          print("Emergency request sent");
          await alertAdminRequest();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminDashboard(),
              ));
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
