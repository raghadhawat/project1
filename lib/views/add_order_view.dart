import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/add_order_buttom_sheet.dart';
import 'package:pharma_track/widgets/custom_edit_order_buttom_sheet.dart';
import 'package:pharma_track/widgets/add_order_card.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});
  static String id = 'AddOrderView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<AllApiCubit>(context).lastFour(context);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 32,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.grey,
              size: 35,
            ),
          )
        ],
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          List<AddOrderModel> orders =
              BlocProvider.of<OrderCubit>(context).orders! ?? [];
          return BlocConsumer<AllApiCubit, AllApiState>(
            listener: (context, state) {
              if (state is SendOrderSuccess) {
                for (var order in orders) {
                  order.delete();
                }

                print(BlocProvider.of<OrderCubit>(context).orders!);
                BlocProvider.of<OrderCubit>(context).fetchAllOrder();
              } else if (state is SendOrderFailure) {
                print(state.errMessage);
                showSnakbar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your cart: ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    context: context,
                                    builder: (context) {
                                      return EditOrderButtomSheeet(
                                        order: orders[index],
                                      );
                                    });
                              },
                              child: AddOrderCard(
                                order: orders[index],
                              ));
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                context: context,
                                builder: (context) {
                                  return const AddOrderButtomSheeet();
                                });
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff31a9e3)),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Add Order',
                                style: TextStyle(
                                    color: Color(0xff31a9e3),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Warning",
                                      style:
                                          TextStyle(color: Color(0xff31a9e3)),
                                    ),
                                    content: Text(
                                      "are you sure to send this cart?",
                                      style: TextStyle(fontSize: 16),
                                    ),
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
                                            BlocProvider.of<AllApiCubit>(
                                                    context)
                                                .sendorder(
                                                    orders: BlocProvider.of<
                                                            OrderCubit>(context)
                                                        .orders!,
                                                    context: context);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "ok",
                                            style: TextStyle(fontSize: 20),
                                          ))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff31a9e3)),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Send cart',
                                style: TextStyle(
                                    color: Color(0xff31a9e3),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
