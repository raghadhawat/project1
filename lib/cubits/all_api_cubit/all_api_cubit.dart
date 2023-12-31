import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/models/all_medicine_model.dart';
import 'package:pharma_track/models/medicine_model.dart';
import 'package:pharma_track/models/order_model.dart';
import 'package:pharma_track/models/order_status_model.dart';
import 'package:pharma_track/models/send_order_model.dart';

part 'all_api_state.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());
  static AllApiCubit get(context) => BlocProvider.of(context);

  //// category service

  allCategory(context) async {
    emit(AllApiLoading());
    try {
      await getAllCategory(context);

      emit(AllApiSuccess());
    } catch (e) {
      emit(AllApiFailur(e.toString()));
    }
  }

  CategoryModel? categoryModel1;
  Future<List<Data>?> getAllCategory(context) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category',
      token: AuthCubit.get(context).token1,
    )
        .then((value) {
      categoryModel1 = CategoryModel.fromJson(value);
    });
  }

  /// all medicine service

  allMedicine(context) async {
    emit(AllMedicineLoading());
    try {
      await getAllMedicine(context);

      emit(AllMedicineSuccess());
    } catch (e) {
      emit(AllMedicineFailur(e.toString()));
    }
  }

  AllMedicineModel? allMedicineModel;
  Future<List<AllMedicineData>?> getAllMedicine(context) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).token1,
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
    });
  }

  /// medicine service

  medicine(context, {required int id}) async {
    emit(MedicineLoading());

    try {
      await getMedicine(context, id: id);
      emit(MedicineSuccess());
    } catch (e) {
      emit(MedicineFailure(e.toString()));
    }
  }

  MedicineModel? medicineModel;
  Future<Map<String, dynamic>?> getMedicine(context, {required int id}) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category/$id',
      token: AuthCubit.get(context).token1,
    )
        .then((value) {
      print(value);
      medicineModel = MedicineModel.fromJson(value);
    });
  }

  ////send order
  SendOrderModel? sendOrderModel;
  sendorder({
    context,
    required List<dynamic> orders,
  }) async {
    Map<String, dynamic> map = {};
    for (int i = 0; i < orders.length; i++) {
      map.addAll(
        {
          '${i + 1}': {
            "medicines_name": "${orders[i].name}",
            "quantity": "${orders[i].quantity}"
          },
        },
      );
    }
    print(map);
    emit(SendOrderLoading());

    try {
      await sendOrders(context, orders: map);
      emit(SendOrderSuccess());
    } catch (e) {
      emit(SendOrderFailure(e.toString()));
    }
  }

  Future<SendOrderModel?> sendOrders(
    context, {
    required Map<String, dynamic> orders,
  }) async {
    await Api()
        .post(
      url: 'http://10.0.2.2:8000/api/Pharmacy/cart/store',
      token: AuthCubit.get(context).token1,
      body: jsonEncode(orders),
      header: true,
    )
        .then((value) {
      sendOrderModel = SendOrderModel.fromJson(value);
    });
  }

  /// order status

  orderStatus(context) async {
    emit(OrderStateLoading());
    try {
      await orderState(context);

      emit(OrderStateSuccess());
    } catch (e) {
      emit(OrderStateFailure(e.toString()));
    }
  }

  OrderStatusModel? orderStatusModel;
  Future<List<OrderStatusData>?> orderState(context) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/cart/index',
      token: AuthCubit.get(context).token1,
    )
        .then((value) {
      orderStatusModel = OrderStatusModel.fromJson(value);
    });
  }

  orders(context, {required int id}) async {
    emit(OrderLoading());
    try {
      await order(context, id: id);

      emit(OrderSuccess());
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }

  OrderModel? orderModel;
  Future<List<OrderStatusData>?> order(context, {required int id}) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/cart/show/$id',
      token: AuthCubit.get(context).token1,
    )
        .then((value) {
      orderModel = OrderModel.fromJson(value);
    });
  }
}
