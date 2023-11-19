part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final List<String>? categories;

  const CategoryState({required this.categories});

  CategoryState copyWith({List<String>? categories}) {
    return CategoryState(categories: categories ?? this.categories);
  }

  @override
  List<Object?> get props => [categories];
}
