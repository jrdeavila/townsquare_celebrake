import 'package:townsquare/lib.dart';

abstract interface class IActivityRepository {
  Future<List<ActivityEntity>> getActivities();
  Future<ActivityEntity> getActivity(String id);
}
