import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivityModel extends Equatable {
  final String id;
  final String title;
  final String place;
  final double price;
  final int availableSeats;
  final Duration duration;
  final TimeOfDay startTime;
  final CategoryModel category;

  const ActivityModel({
    required this.id,
    required this.title,
    required this.place,
    required this.price,
    required this.availableSeats,
    required this.duration,
    required this.startTime,
    required this.category,
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
