import 'package:equatable/equatable.dart';
import 'package:townsquare/lib.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
