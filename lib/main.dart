import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  AwesomeNotifications().initialize(
    '',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'Notification channel for basic tests',
      ),
    ],
  );
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.tealAccent,
        ),
      ),
      title: 'Green Thumbs',
      home: const HomePage(),
    );
  }
}
