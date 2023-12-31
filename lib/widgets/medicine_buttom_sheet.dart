import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';

import 'package:pharma_track/widgets/medicine_form.dart';

class MedicineButtomSheeet extends StatelessWidget {
  const MedicineButtomSheeet({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(),
      child: BlocConsumer<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
          if (state is AddOrderFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddOrderSuccess) {
            BlocProvider.of<OrderCubit>(context).fetchAllOrder();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddOrderLoading ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: MedicineForm(
                  name: name,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
