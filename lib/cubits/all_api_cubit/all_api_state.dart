part of 'all_api_cubit.dart';

@immutable
sealed class AllApiState {}

final class AllApiInitial extends AllApiState {}

final class AllApiLoading extends AllApiState {}

final class AllApiSuccess extends AllApiState {}

final class AllApiFailur extends AllApiState {
  final String errMessage;
  AllApiFailur(this.errMessage);
}

final class AllMedicineLoading extends AllApiState {}

final class AllMedicineSuccess extends AllApiState {}

final class AllMedicineFailur extends AllApiState {
  final String errMessage;
  AllMedicineFailur(this.errMessage);
}

final class MedicineLoading extends AllApiState {}

final class MedicineSuccess extends AllApiState {}

final class MedicineFailure extends AllApiState {
  final String errMessage;
  MedicineFailure(this.errMessage);
}
