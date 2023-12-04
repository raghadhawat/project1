import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/models/add_order_model.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());
  bool isLoading = false;
  addOrder(AddOrderModel order) async {
    emit(AddOrderLoading());

    try {
      var orderBox = Hive.box<AddOrderModel>(kOrderBox);
      await orderBox.add(order);
      emit(AddOrderSuccess());
    } on Exception catch (e) {
      emit(AddOrderFailure(e.toString()));
    }
  }
}
