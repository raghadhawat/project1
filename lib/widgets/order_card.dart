import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
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
          color: kThirdColor2,
          child: Row(
            children: [
              Image.asset(order.image),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      order.name,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      order.tName,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  order.quantity,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  order.delete();
                  BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                },
                icon: const Icon(
                  Icons.close,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
