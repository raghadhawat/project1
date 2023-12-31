import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/order_view.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/order_status_card.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static String id = 'OrderStatusView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    Color color = Color(0xff31a9e3);
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is OrderLoading) {
          isLoading = true;
        } else if (state is OrderSuccess) {
          Navigator.pushNamed(context, OrderView.id);
          isLoading = false;
        } else if (state is OrderFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 32,
                    )),
                backgroundColor: Colors.white,
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                ],
                elevation: 0.0,
              ),
              body: ListView.builder(
                  itemCount: cubit.orderStatusModel?.data?.length,
                  itemBuilder: (context, index) {
                    if (cubit.orderStatusModel!.data![index].status == "New") {
                      color = Color(0xff31a9e3);
                    } else if (cubit.orderStatusModel!.data![index].status ==
                        "Preparing") {
                      color = Colors.deepPurple[500]!;
                    } else if (cubit.orderStatusModel!.data![index].status ==
                        "Delivering") {
                      color = Colors.orange[500]!;
                    } else if (cubit.orderStatusModel!.data![index].status ==
                        "Recieved") {
                      color = Colors.green[500]!;
                    }
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context).orders(context,
                            id: cubit.orderStatusModel!.data![index].id!);
                      },
                      child: OrderStatusCard(
                        price:
                            "${cubit.orderStatusModel?.data?[index].Total_price}",
                        status:
                            "${cubit.orderStatusModel?.data?[index].status}",
                        paidStatus:
                            "${cubit.orderStatusModel?.data?[index].paidStatus}",
                        date:
                            "${cubit.orderStatusModel?.data?[index].createdAt}",
                        color: color,
                      ),
                    );
                  })),
        );
      },
    );
  }
}
