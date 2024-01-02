import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';

class AddOrderCard extends StatelessWidget {
  const AddOrderCard({
    super.key,
    required this.order,
  });
  final AddOrderModel order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kThirdColor, borderRadius: BorderRadius.circular(16)),
        height: 100,
        child: Card(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 90,
                decoration: const BoxDecoration(
                  color: Color(0xff31a9e3),
                ),
                child: Center(
                    child: Text(
                  order.quantity,
                  style: const TextStyle(
                      color: kThirdColor2,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  order.name,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: IconButton(
                  onPressed: () {
                    order.delete();

                    BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
