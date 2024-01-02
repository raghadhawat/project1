import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/order_card.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static String id = 'OrderView';

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    print(cubit.orderModel!.data);
    return Scaffold(
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
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: cubit.orderModel?.data?.length,
            itemBuilder: (context, index) {
              return OrderCard(
                name: cubit.orderModel!.data![index].medicinesName!,
                quantity: cubit.orderModel!.data![index].quantity!,
                id: cubit.orderModel!.data![index].id!,
              );
            }));
  }
}
