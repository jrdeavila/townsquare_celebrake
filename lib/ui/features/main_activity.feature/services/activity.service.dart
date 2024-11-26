import 'package:flutter/material.dart';
import 'package:townsquare/lib.dart';

class ActivityModelService {
  final IFetchDomainActivityEntityUseCase _fetchDomainActivityEntityUseCase;
  final IFetchDomainCategoryEntityUseCase _fetchDomainCategoryEntityUseCase;

  ActivityModelService(this._fetchDomainActivityEntityUseCase,
      this._fetchDomainCategoryEntityUseCase);

  Future<List<ActivityModel>> fetchActivityModel() async {
    final activityModel =
        await _fetchDomainActivityEntityUseCase.fetchActivityModel();
    final categoryModel = await fetchCategoryModel();
    return activityModel
        .map((e) => ActivityModel(
              id: e.id,
              title: e.title,
              place: e.place,
              availableSeats: int.parse(e.availableSeats),
              category: categoryModel
                  .firstWhere((element) => element.id == e.categoryId),
              price: double.parse(e.price),
              duration: Duration(
                  hours: int.parse(e.duration.split(":")[0]),
                  minutes: int.parse(e.duration.split(":")[1])),
              startTime: TimeOfDay(
                  hour: int.parse(e.startTime.split(":")[0]),
                  minute: int.parse(e.startTime.split(":")[1])),
            ))
        .toList();
  }

  Future<List<CategoryModel>> fetchCategoryModel() async {
    final categoryModel =
        await _fetchDomainCategoryEntityUseCase.fetchCategoryModel();
    return categoryModel
        .map((e) => CategoryModel.fromEntity(
              e,
            ))
        .toList();
  }
}
