import 'package:townsquare/lib.dart';

class FakeActivityRepository implements IActivityRepository {
  final List<ActivityEntity> fakeActivities = [
    const ActivityEntity(
      id: "1",
      title: "Morning Yoga",
      place: "Central Park",
      availableSeats: "8",
      categoryId: "1", // Sports
      price: "5.0",
      duration: "01:00",
      startTime: "07:00",
      details: "Outdoor session • Light intensity",
    ),
    const ActivityEntity(
      id: "2",
      title: "Cooking Workshop",
      place: "Community Center",
      availableSeats: "5",
      categoryId: "2", // Food
      price: "10.0",
      duration: "02:00",
      startTime: "12:00",
      details: "Outdoor session • Medium intensity",
    ),
    const ActivityEntity(
      id: "3",
      title: "Kids Art Class",
      place: "Art Studio",
      availableSeats: "10",
      categoryId: "3", // Kids
      price: "0.0",
      duration: "01:30",
      startTime: "15:00",
      details: "Medium intensity",
    ),
    const ActivityEntity(
      id: "4",
      title: "Evening Football Match",
      place: "Local Stadium",
      availableSeats: "12",
      categoryId: "1", // Sports
      price: "7.0",
      duration: "02:00",
      startTime: "18:00",
      details: "Childcare included • High intensity",
    ),
    const ActivityEntity(
      id: "5",
      title: "Creative Writing Workshop",
      place: "Library Hall",
      availableSeats: "6",
      categoryId: "4", // Creative
      price: "8.0",
      duration: "01:00",
      startTime: "16:30",
      details: "Outdoor session • Light intensity",
    ),
    const ActivityEntity(
      id: "6",
      title: "Family Picnic",
      place: "Riverside Park",
      availableSeats: "15",
      categoryId: "2", // Food
      price: "0.0",
      duration: "03:00",
      startTime: "11:00",
      details: "Outdoor session • Light intensity",
    ),
  ];

  @override
  Future<List<ActivityEntity>> getActivities() {
    return Future.value(fakeActivities);
  }

  @override
  Future<ActivityEntity> getActivity(String id) {
    return Future.value(
        fakeActivities.firstWhere((element) => element.id == id));
  }
}
