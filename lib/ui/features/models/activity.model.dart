import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

enum ActivityDetail {
  light,
  medium,
  high,
  outdoor,
  childcare,
  workspace,
}

const availableDetails = {
  "Light intensity": ActivityDetail.light,
  "Medium intensity": ActivityDetail.medium,
  "High intensity": ActivityDetail.high,
  "Outdoor session": ActivityDetail.outdoor,
  "Childcare included": ActivityDetail.childcare,
  "Workspace available": ActivityDetail.workspace,
};

const detailLabels = {
  ActivityDetail.light: "light",
  ActivityDetail.medium: "medium",
  ActivityDetail.high: "medium",
  ActivityDetail.outdoor: "Outdoor",
  ActivityDetail.childcare: "childcare",
  ActivityDetail.workspace: "workspace",
};

ActivityDetail getActivityDetailFromString(String detail) {
  return availableDetails[detail]!;
}

String getStringFromActivityDetail(ActivityDetail detail) {
  return detailLabels[detail]!;
}

Map<String, Color> getColorFromActivityDetail(ActivityDetail detail) {
  switch (detail) {
    case ActivityDetail.light:
      return {
        "title": Get.find<AppColors>().lightIntensity,
        "background": Get.find<AppColors>().lightIntensityTitle,
      };
    case ActivityDetail.medium:
      return {
        "title": Get.find<AppColors>().mediumIntensity,
        "background": Get.find<AppColors>().mediumIntensityTitle,
      };
    case ActivityDetail.high:
      return {
        "title": Get.find<AppColors>().highIntensity,
        "background": Get.find<AppColors>().highIntensityTitle,
      };
    case ActivityDetail.outdoor:
      return {
        "title": Get.find<AppColors>().neutral300,
        "background": Get.find<AppColors>().neutral600,
      };
    case ActivityDetail.childcare:
      return {
        "title": Get.find<AppColors>().childCareTag,
        "background": Get.find<AppColors>().childCareTitle,
      };
    case ActivityDetail.workspace:
      return {
        "title": Get.find<AppColors>().workplaceTag,
        "background": Get.find<AppColors>().white,
      };
  }
}

class ActivityModel extends Equatable {
  final String id;
  final String title;
  final String place;
  final double price;
  final int availableSeats;
  final Duration duration;
  final TimeOfDay startTime;
  final CategoryModel category;
  final List<ActivityDetail> details;

  const ActivityModel({
    required this.id,
    required this.title,
    required this.place,
    required this.price,
    required this.availableSeats,
    required this.duration,
    required this.startTime,
    required this.category,
    required this.details,
  });

  String get formattedDuration {
    if (duration.inHours == 0) {
      return "${duration.inMinutes}m";
    }
    return "${duration.inHours}h ${duration.inMinutes.remainder(60)}m";
  }

  String get formattedParticipants {
    if (availableSeats == 0) {
      return "No seats available";
    }
    return "$availableSeats ${Get.find<AppStrings>().spotsLeftLabel.tr}";
  }

  String get formattedPrice {
    if (price == 0) {
      return "Free";
    }
    return "$price${Get.find<AppStrings>().currencySymbol.tr}";
  }

  String get formattedStartTime {
    return "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        place,
        price,
        availableSeats,
        duration,
        startTime,
        category,
      ];
}
