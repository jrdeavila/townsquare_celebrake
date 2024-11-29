import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivitySidebarItem extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final bool isButton;
  final VoidCallback callback;

  const ActivitySidebarItem({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.isButton,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
              color: isButton
                  ? Get.find<AppColors>().black
                  : Get.find<AppColors>().white,
            ),
          ),
          child: Container(
            decoration: isButton
                ? BoxDecoration(
                    color: Get.find<AppColors>().primary600,
                    borderRadius: BorderRadius.circular(30),
                  )
                : null,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            constraints: BoxConstraints(
                minHeight: 50, maxWidth: isButton ? 200 : 300, minWidth: 180),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (prefixIcon != null) prefixIcon!,
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(label,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: isButton
                                ? Get.find<AppColors>().black
                                : Get.find<AppColors>().white,
                            overflow: TextOverflow.ellipsis,
                          )),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (suffixIcon != null) suffixIcon!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActivitySidebar extends StatelessWidget {
  const ActivitySidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.find<ResponsiveController>().isTablet ? 300 : 350,
      color: Get.find<AppColors>().black,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 150),
            child: Center(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "TWN",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Get.find<AppColors>().white,
                      ),
                ),
                Text(
                  "SQR",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Get.find<AppColors>().primary600,
                      ),
                ),
              ]),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              ...Get.find<ActivityController>()
                  .sidebarItems
                  .map((e) => ActivitySidebarItem(
                        label: e.title.tr,
                        isButton: e.isButton,
                        callback: e.onTap,
                        prefixIcon: e.prefixIcon,
                        suffixIcon: e.suffixIcon,
                      ))
            ],
          )),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageSelector(),
              SizedBox(width: 20),
              ThemeSelector()
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
