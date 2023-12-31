part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading1 extends OrderState {}

final class OrderSuccess1 extends OrderState {}
