import 'package:flutter/material.dart';
import 'package:townsquare/lib.dart';
import 'package:get/get.dart';
import 'package:awesome_icons/awesome_icons.dart';

class CategoryScrollableList extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  const CategoryScrollableList(
      {super.key, required this.categories, required this.currentCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        scrollDirection: Axis.horizontal,
        children: [
          const CategoryDefaultCard(isSelected: false),
          CategoryCard(
            category: CategoryModel.defaultModel(),
            isSelected: currentCategory == CategoryModel.defaultModel(),
          ),
          ...categories.map((category) {
            return Center(child: CategoryCard(category: category));
          })
        ],
      ),
    );
  }
}

class CategoryDefaultCard extends StatelessWidget {
  final bool isSelected;

  const CategoryDefaultCard({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? Get.find<AppColors>().secondaryB500
            : Get.find<AppColors>().secondaryB300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child:
            Icon(FontAwesomeIcons.slidersH, color: Get.find<AppColors>().black),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const CategoryCard(
      {super.key, required this.category, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? Get.find<AppColors>().secondaryB500
            : Get.find<AppColors>().secondaryB300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          category.name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Get.find<AppColors>().black,
              ),
        ),
      ),
    );
  }
}
