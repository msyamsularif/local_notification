import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.seedling,
          color: Colors.teal[50],
        ),
        const Text('GreenThumbs'),
      ],
    );
  }
}

class PlantImage extends StatelessWidget {
  const PlantImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/plant.png'),
      height: 400,
    );
  }
}

class HomePageButtons extends StatelessWidget {
  final Future<void> Function() onPressedOne;
  final Future<void> Function() onPressedTwo;
  final Future<void> Function() onPressedThree;
  const HomePageButtons({
    Key? key,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.onPressedThree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedOne,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.dollarSign,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Plant Food',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedTwo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.droplet,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Water',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal[600],
                ),
              ),
              onPressed: onPressedThree,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidCircleXmark,
                    size: 14,
                    color: Colors.teal[50],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantStats extends StatelessWidget {
  const PlantStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.bolt,
                size: 20,
                color: Colors.yellow[600],
              ),
              const SizedBox(width: 3),
              const Text(
                '25%',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.droplet,
                size: 20,
                color: Colors.teal[50],
              ),
              const SizedBox(width: 3),
              const Text(
                '80%',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.cloudSun,
                size: 20,
                color: Colors.yellow[600],
              ),
              const SizedBox(width: 3),
              const Text(
                '60%',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String dateTime;
  final bool? isRead;
  final VoidCallback onPressed;
  final VoidCallback onDeleted;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    this.isRead = false,
    required this.onPressed,
    required this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateFormate = DateFormat('EEE, dd MMMM yyyy - kk:mm').format(
      DateTime.parse(dateTime),
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: isRead ?? false ? Colors.grey[200] : Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dateFormate,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              IconButton(
                onPressed: onDeleted,
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                color: Colors.black,
                icon: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
          textColor: Colors.black,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
