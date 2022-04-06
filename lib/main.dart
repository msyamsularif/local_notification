import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:example_local_notification/view-models/notification_history/notification_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_page.dart';

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
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
        channelDescription: 'Notification channel for scheduled',
      ),
    ],
  );
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationHistoryCubit>(
      create: (context) => NotificationHistoryCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.tealAccent,
          ),
        ),
        title: 'Green Thumbs',
        home: const HomePage(),
      ),
    );
  }
}
