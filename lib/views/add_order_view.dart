import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/add_order_buttom_sheet.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/custom_edit_order_buttom_sheet.dart';
import 'package:pharma_track/widgets/order_card.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});
  static String id = 'AddOrderView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const AppBarText(),
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
                children: [
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
                              child: OrderCard(
                                order: orders[index],
                              ));
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
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
                            height: 75,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Color(0xff35bcd7),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Add Order',
                                style: TextStyle(
                                    color: kThirdColor2,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AllApiCubit>(context).sendorder(
                                orders: BlocProvider.of<OrderCubit>(context)
                                    .orders!,
                                context: context);
                          },
                          child: Container(
                            height: 75,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Color(0xff35bcd7),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Send Orders',
                                style: TextStyle(
                                    color: kThirdColor2,
                                    fontSize: 24,
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
