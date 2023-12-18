import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/order_status_card.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static String id = 'OrderStatusView';

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocBuilder<AllApiCubit, AllApiState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const AppBarText(),
              backgroundColor: kPrimaryColor,
            ),
            body: ListView.builder(
                itemCount: cubit.orderStatusModel?.data?.length,
                itemBuilder: (context, index) {
                  return OrderStatusCard(
                    status: cubit.orderStatusModel?.data?[index].status,
                    paidStatus: cubit.orderStatusModel?.data?[index].paidStatus,
                    date: cubit.orderStatusModel?.data?[index].createdAt,
                    id: cubit.orderStatusModel?.data?[index].id,
                  );
                }));
      },
    );
  }
}
