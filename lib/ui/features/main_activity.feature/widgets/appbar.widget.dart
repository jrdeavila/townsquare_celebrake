import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivityAppBar extends StatelessWidget implements PreferredSize {
  const ActivityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Get.find<ActivityController>().currentDateString,
                  style: Theme.of(context).textTheme.bodySmall),
              Text(Get.find<AppStrings>().thisWeekMessage,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(FontAwesomeIcons.bell, size: 30),
            onPressed: () => throw UnimplementedError(),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/img/profile.png"),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 100);
}
