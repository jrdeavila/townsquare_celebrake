import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class PopularEventsCard extends StatelessWidget {
  const PopularEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const userImageAssets = [
      "assets/img/popular_event_user_1.png",
      "assets/img/popular_event_user_2.png",
      "assets/img/popular_event_user_3.png",
    ];
    return Container(
      padding: const EdgeInsets.all(30),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.find<AppColors>().black,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: const AssetImage("assets/img/popular_events.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Get.find<AppColors>().black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Get.find<AppStrings>().popularEventsCardTitle.tr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Get.find<AppColors>().white,
                  )),
          const Spacer(),
          Text(Get.find<AppStrings>().popularEventsCardSubtitle.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Get.find<AppColors>().white,
                  )),
          const SizedBox(height: 10),
          const PopularEventsSeeMoreButton(userImageAssets: userImageAssets),
        ],
      ),
    );
  }
}

class PopularEventsSeeMoreButton extends StatelessWidget {
  const PopularEventsSeeMoreButton({
    super.key,
    required this.userImageAssets,
  });

  final List<String> userImageAssets;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: _buildSeeMoreSection(context),
              ),
              ...List.generate(
                userImageAssets.length,
                (index) => Positioned(
                  left: index * 30.0,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(userImageAssets[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeeMoreSection(BuildContext context) {
    return Container(
        height: 45,
        margin: const EdgeInsets.only(left: 80),
        decoration: BoxDecoration(
          color: Get.find<AppColors>().white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Text(Get.find<AppStrings>().popularEventsCardButton.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Get.find<AppColors>().black,
                  )),
        ));
  }
}
