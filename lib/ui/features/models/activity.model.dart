import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
