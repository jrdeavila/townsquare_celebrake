import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivityBottomNavBar extends StatelessWidget {
  const ActivityBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.calendar),
            onPressed: () => throw UnimplementedError(),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.map),
            onPressed: () => throw UnimplementedError(),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Get.find<AppColors>().primary200,
              shape: BoxShape.circle,
            ),
            child: const Icon(FontAwesomeIcons.plus),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.userFriends),
            onPressed: () => throw UnimplementedError(),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.star),
            onPressed: () => throw UnimplementedError(),
          ),
        ].map((e) => Expanded(child: Center(child: e))).toList(),
      ),
    );
  }
}
