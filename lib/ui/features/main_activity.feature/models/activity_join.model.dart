import 'package:equatable/equatable.dart';
import 'package:townsquare/lib.dart';

class ActivityJoinModel extends Equatable {
  final ActivityModel activity;
  final bool isJoined;

  const ActivityJoinModel({required this.activity, required this.isJoined});

  @override
  List<Object?> get props => [activity, isJoined];
}
