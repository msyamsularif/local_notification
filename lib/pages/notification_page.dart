import '../view-models/notification_history/notification_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notification'),
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationHistoryCubit, NotificationHistoryState>(
          buildWhen: (previous, current) =>
              previous.isDelete != current.isDelete,
          builder: (context, state) {
            if (state.notifications.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    key: Key(state.notifications[index].id),
                    title: state.notifications[index].title,
                    subTitle: state.notifications[index].subTitle,
                    dateTime: state.notifications[index].dateTime,
                    isRead: state.notifications[index].isRead,
                    onPressed: state.notifications[index].onPressed,
                    onDeleted: () {
                      context
                          .read<NotificationHistoryCubit>()
                          .deleteNotification(state.notifications[index]);
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'Notification Not Found',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
