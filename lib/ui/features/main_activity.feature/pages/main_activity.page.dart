import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class MainActivityPage extends StatelessWidget {
  const MainActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = Get.find<ActivityController>().isLoading;
      final activityList = Get.find<ActivityController>().activityList;
      final categories = Get.find<ActivityController>().categories;
      final selectedCategory = Get.find<ActivityController>().selectedCategory;
      // ================== Responsive UI ==================
      final isWeb = MediaQuery.of(context).size.width > 1400;
      final isMobile = MediaQuery.of(context).size.width <= 800;

      if (isWeb) {
        return WebActivityPageView(
          categories: categories,
          currentCategory: selectedCategory,
          activityList: activityList,
          isLoading: isLoading,
        );
      }
      if (isMobile) {
        return MobileActivityPageView(
          categories: categories,
          currentCategory: selectedCategory,
          activityList: activityList,
          isLoading: isLoading,
        );
      }
      return TabletActivityPageView(
        categories: categories,
        currentCategory: selectedCategory,
        activityList: activityList,
        isLoading: isLoading,
      );
    });
  }
}

class WebActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const WebActivityPageView({
    super.key,
    required this.categories,
    required this.currentCategory,
    required this.activityList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ActivitySidebar(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ActivitySearchBar(),
                  const SizedBox(height: 16),
                  CategoryScrollableList(
                    categories: categories,
                    currentCategory: currentCategory,
                  ),
                  const SizedBox(height: 16),
                  if (isLoading)
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (!isLoading)
                    Expanded(
                      child: ActivityScrollableList(
                        activityList: activityList,
                      ),
                    )
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  JoinTimerCard(),
                  SizedBox(height: 20),
                  WeeklyWorkshopCard(),
                  SizedBox(height: 20),
                  PopularEventsCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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

class WeeklyWorkshopCard extends StatelessWidget {
  const WeeklyWorkshopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 280,
      decoration: BoxDecoration(
        color: Get.find<AppColors>().secondary200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(Get.find<AppStrings>().weeklyWorkshopCardTitle.tr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Get.find<AppColors>().black,
                  )),
          const SizedBox(height: 10),
          Text(Get.find<AppStrings>().weeklyWorkshopCardSubtitle.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Get.find<AppColors>().black,
                  )),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Expanded(
                    child: Text(
                        Get.find<AppStrings>().weeklyWorkshopCardButton.tr)),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
                minHeight: 50, maxWidth: isButton ? 180 : 250, minWidth: 180),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (prefixIcon != null) prefixIcon!,
                const SizedBox(
                  width: 30,
                ),
                Text(label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isButton
                              ? Get.find<AppColors>().black
                              : Get.find<AppColors>().white,
                          overflow: TextOverflow.ellipsis,
                        )),
                const Spacer(),
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
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 350),
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

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ThemeController>().changeTheme();
      },
      child: MouseRegion(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Get.find<AppColors>().blackB,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Get.find<AppColors>().white, width: 4),
          ),
          child: Center(
            child: Icon(
              Get.find<ThemeController>().isDarkMode
                  ? FontAwesomeIcons.sun
                  : FontAwesomeIcons.moon,
              color: Get.find<AppColors>().white,
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final List<AppLocale> _supportedLocales =
      Get.find<LocaleController>().supportedLocales;
  AppLocale _currentLocale =
      Get.find<LocaleController>().supportedLocales.first;

  void _showLanguageSelector(TapDownDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(details.globalPosition);
    final List<PopupMenuEntry<AppLocale>> items = _supportedLocales
        .map((locale) => PopupMenuItem<AppLocale>(
              value: locale,
              child: Row(
                children: [
                  Image.asset(
                    locale.flagAsset,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(locale.title.tr),
                ],
              ),
            ))
        .toList();
    showMenu<AppLocale>(
      context: context,
      position:
          RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: items,
    ).then((value) {
      if (value != null) {
        setState(() {
          _currentLocale = value;
          Get.updateLocale(Locale(value.languageCode, value.countryCode));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _showLanguageSelector,
      child: MouseRegion(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Get.find<AppColors>().blackB,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Get.find<AppColors>().white, width: 4),
            image: DecorationImage(
              image: AssetImage(_currentLocale.flagAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class TabletActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const TabletActivityPageView(
      {super.key,
      required this.categories,
      required this.currentCategory,
      required this.activityList,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ActivitySidebar(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const JoinTimerCard(),
                const SizedBox(height: 16),
                const ActivitySearchBar(),
                const SizedBox(height: 16),
                CategoryScrollableList(
                    categories: categories, currentCategory: currentCategory),
                const SizedBox(height: 16),
                if (isLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (!isLoading)
                  Expanded(
                    child: ActivityScrollableList(
                      activityList: activityList,
                    ),
                  )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class MobileActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const MobileActivityPageView({
    super.key,
    required this.categories,
    required this.currentCategory,
    required this.activityList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ActivityAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const JoinTimerCard(),
            const SizedBox(height: 16),
            const ActivitySearchBar(),
            const SizedBox(height: 16),
            CategoryScrollableList(
              categories: categories,
              currentCategory: currentCategory,
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (!isLoading)
              Expanded(
                child: ActivityScrollableList(activityList: activityList),
              )
          ],
        ),
      ),
      bottomNavigationBar: const ActivityBottomNavBar(),
    );
  }
}
