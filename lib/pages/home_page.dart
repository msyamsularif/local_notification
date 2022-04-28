import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/notifications.dart';
import '../models/notification_model.dart';
import '../utils/utilities.dart';
import '../view-models/notification_history/notification_history_cubit.dart';
import '../widgets/widgets.dart';
import 'notification_page.dart';
import 'plant_stats_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );

    AwesomeNotifications().displayedStream.listen((notification) {
      context.read<NotificationHistoryCubit>().addNotification(
            ModelNotification(
              id: notification.id.toString(),
              title: notification.title!,
              subTitle: notification.body!,
              dateTime: DateTime.now().toIso8601String(),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PlantStatsPage(),
                  ),
                  (route) => route.isFirst,
                );

                AwesomeNotifications().dismiss(notification.id!);

                context
                    .read<NotificationHistoryCubit>()
                    .updateNotification(notification.id.toString());
              },
            ),
          );
    });

    AwesomeNotifications().createdStream.listen((notification) async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notification Created on ${notification.channelKey}'),
        ),
      );
    });

    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1));
      }

      context
          .read<NotificationHistoryCubit>()
          .updateNotification(notification.id.toString());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const PlantStatsPage(),
          ),
          (route) => route.isFirst);
    });

    super.initState();
  }

  @override
  void dispose() {
    AwesomeNotifications().displayedSink.close();
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: [
          BlocBuilder<NotificationHistoryCubit, NotificationHistoryState>(
            buildWhen: (previous, current) =>
                previous.isAdded != current.isAdded ||
                previous.isDelete != current.isDelete ||
                previous.isUpdate != current.isUpdate,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationPage(),
                    ),
                  );
                },
                icon: Badge(
                  badgeContent: Text(
                    state.notifications
                        .where((e) => e.isRead == false)
                        .length
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PlantStatsPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.insert_chart_outlined_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PlantImage(),
            const SizedBox(
              height: 25,
            ),
            HomePageButtons(
              onPressedOne: createPlantFoodNotification,
              onPressedTwo: () async {
                NotificationWeekAndTime? pickedSchedule =
                    await pickSchedule(context);

                if (pickedSchedule != null) {
                  createWaterReminderNotification(pickedSchedule);
                }
              },
              onPressedThree: cancelScheduledNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
