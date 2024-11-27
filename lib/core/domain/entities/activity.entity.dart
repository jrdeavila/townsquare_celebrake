import 'package:equatable/equatable.dart';

class ActivityEntity extends Equatable {
  final String id;
  final String title;
  final String place;
  final String categoryId;
  final String price;
  final String startTime; // Time in hours and minutes. Ex: 09:00
  final String availableSeats;
  final String duration; // Duration in hours and minutes. Ex: 02:30
  final String
      details; // Outdoor session • Light intensity | Outdoor session • Light intensity | Outdoor session • Light intensity

  const ActivityEntity({
    required this.id,
    required this.title,
    required this.place,
    required this.categoryId,
    required this.startTime,
    required this.price,
    required this.availableSeats,
    required this.duration,
    required this.details,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        place,
        categoryId,
        startTime,
        price,
        availableSeats,
        duration,
        details,
      ];
}
