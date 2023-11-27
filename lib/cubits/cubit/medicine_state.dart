part of 'medicine_cubit.dart';

@immutable
sealed class MedicineState {}

final class MedicineInitial extends MedicineState {}
final class MedicineLoading extends MedicineState {}
final class MedicineSuccess extends MedicineState {}
final class MedicineFailure extends MedicineState {
  final String errMessage;
  MedicineFailure(this.errMessage);
}
