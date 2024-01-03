import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/add_favourite_model.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/models/all_medicine_model.dart';
import 'package:pharma_track/models/last_four_status_model.dart';
import 'package:pharma_track/models/medicine_model.dart';
import 'package:pharma_track/models/order_model.dart';
import 'package:pharma_track/models/order_status_model.dart';
import 'package:pharma_track/models/report_model.dart';
import 'package:pharma_track/models/send_order_model.dart';
import 'package:pharma_track/models/show_favourite_model.dart';

part 'all_api_state.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());
  String baseUrl = 'http://192.168.42.66:8000/api';
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
      url: '$baseUrl/Pharmacy/category',
      token: Hive.box(kToken).get(kToken),
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
      url: '$baseUrl/Pharmacy/medicines',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
    });
  }

  /// medicine

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
      url: '$baseUrl/Pharmacy/category/$id',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      print(value);
      medicineModel = MedicineModel.fromJson(value);
    });
  }

  /// medicine2

  medicine2(context, {required int id}) async {
    emit(MedicineLoading2());

    try {
      await getMedicine2(context, id: id);
      emit(MedicineSuccess2());
    } catch (e) {
      emit(MedicineFailure2(e.toString()));
    }
  }

  MedicineModel? medicineModel2;
  Future<Map<String, dynamic>?> getMedicine2(context, {required int id}) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/category/$id',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      print(value);
      medicineModel2 = MedicineModel.fromJson(value);
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
      url: '$baseUrl/Pharmacy/cart/store',
      token: Hive.box(kToken).get(kToken),
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
      url: '$baseUrl/Pharmacy/cart/index',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      orderStatusModel = OrderStatusModel.fromJson(value);
    });
  }

// show order
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
  Future<List<OrderData>?> order(context, {required int id}) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/cart/show/$id',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      orderModel = OrderModel.fromJson(value);
    });
  }

  ///favourite post
  AddFavourite? addFavourite;
  addToFavourite({context, required bool fav, required int id}) async {
    emit(AddFavouriteLoading());

    try {
      await addFavourit(context, fav: fav, id: id);
      emit(AddFavouriteSuccess());
    } catch (e) {
      emit(AddFavouriteFailure(e.toString()));
    }
  }

  Future<AddFavourite?> addFavourit(context,
      {required bool fav, required int id}) async {
    await Api()
        .post(
            url: '$baseUrl/Pharmacy/favorite/add',
            token: Hive.box(kToken).get(kToken),
            body: jsonEncode({"medicine_id": "$id", "is_favorite": fav}),
            header: true)
        .then((value) {
      addFavourite = AddFavourite.fromJson(value);
    });
  }

  /////show favourite
  showFavourite(context) async {
    emit(ShowFavouriteLoading());
    try {
      await ShowFavouritr(
        context,
      );

      emit(ShowFavouriteSuccess());
    } catch (e) {
      emit(ShowFavouriteFailure(e.toString()));
    }
  }

  ShowFavouritreModel? showFavouritrModel;
  Future<List<ShowFavouritreData>?> ShowFavouritr(context) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/favorite',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      showFavouritrModel = ShowFavouritreModel.fromJson(value);
    });
  }

  /////last four

  lastFour(context) async {
    emit(LastFourLoading());
    try {
      await lastFourStatus(
        context,
      );

      emit(LastFourSuccess());
    } catch (e) {
      emit(LastFourFailure(e.toString()));
    }
  }

  LastFourModel? lastFourModel;
  Future<List<lastFourData>?> lastFourStatus(context) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/cart/LatestCarts',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      lastFourModel = LastFourModel.fromJson(value);
    });
  }

  /////Report

  report(context) async {
    emit(ReportLoading());

    try {
       await getReort(
      context,
    );
      emit(ReportSuccess());
    } catch (e) {
      emit(ReportFailure(e.toString()));
    }
  }

  ReportModel? reportModel;
  Future<List<ReportModel>?> getReort(context) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/report',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      reportModel = ReportModel.fromJson(value);
    });
  }
}
