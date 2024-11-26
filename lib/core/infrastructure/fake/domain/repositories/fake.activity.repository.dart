import 'package:townsquare/lib.dart';

class FakeActivityRepository implements IActivityRepository {
  final List<ActivityEntity> fakeActivities = [
    const ActivityEntity(
      id: "1",
      title: "Activity 1",
      place: "Place 1",
      availableSeats: "10",
      categoryId: "1",
      price: "10.0",
      duration: "01:00",
      startTime: "09:00",
    ),
    const ActivityEntity(
      id: "2",
      title: "Activity 2",
      place: "Place 2",
      availableSeats: "20",
      categoryId: "2",
      price: "20.0",
      duration: "02:00",
      startTime: "10:00",
    ),
    const ActivityEntity(
      id: "3",
      title: "Activity 3",
      place: "Place 3",
      availableSeats: "30",
      categoryId: "3",
      price: "30.0",
      duration: "03:00",
      startTime: "11:00",
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
