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
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 110,
        child: Card(
          child: Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Color(0xff31a9e3),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6))),
                  child: Text("")),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        order.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "quantity: ${order.quantity}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Warning",
                                style: TextStyle(color: Color(0xff31a9e3)),
                              ),
                              content: Text(
                                  "Are you sure from deleting this order?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "cancel",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      order.delete();
                                      BlocProvider.of<OrderCubit>(context)
                                          .fetchAllOrder();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "delete",
                                      style: TextStyle(fontSize: 20),
                                    ))
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.close)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
