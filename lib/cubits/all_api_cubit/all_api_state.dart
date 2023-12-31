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

final class SendOrderLoading extends AllApiState {}

final class SendOrderSuccess extends AllApiState {}

final class SendOrderFailure extends AllApiState {
  final String errMessage;
  SendOrderFailure(this.errMessage);
}

final class OrderStateLoading extends AllApiState {}

final class OrderStateSuccess extends AllApiState {}

final class OrderStateFailure extends AllApiState {
  final String errMessage;
  OrderStateFailure(this.errMessage);
}

final class OrderLoading extends AllApiState {}

final class OrderSuccess extends AllApiState {}

final class OrderFailure extends AllApiState {
  final String errMessage;
  OrderFailure(this.errMessage);
}
