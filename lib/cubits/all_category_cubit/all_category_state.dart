part of 'all_category_cubit.dart';

@immutable
sealed class AllCategoryState {}

final class AllCategoryInitial extends AllCategoryState {}

final class AllCategoryLoading extends AllCategoryState {}

final class AllCategorySuccess extends AllCategoryState {}

final class AllCategoryFailur extends AllCategoryState {
  final String errMessage;
  AllCategoryFailur(this.errMessage);
}
