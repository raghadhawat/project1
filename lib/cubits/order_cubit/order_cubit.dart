import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/models/add_order_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  List<AddOrderModel>? orders;
  fetchAllOrder() {
    var orderBox = Hive.box<AddOrderModel>(kOrderBox);
    orders = orderBox.values.toList();

    emit(OrderSuccess());
  }
}
