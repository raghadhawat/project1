import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/order_view.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/order_status_card2.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static String id = 'OrderStatusView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
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
                centerTitle: true,
                title: const AppBarText(),
                backgroundColor: kPrimaryColor,
              ),
              body: ListView.builder(
                  itemCount: cubit.orderStatusModel?.data?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context).orders(context,
                            id: cubit.orderStatusModel!.data![index].id!);
                      },
                      child: OrderStatusCard(
                        status: cubit.orderStatusModel?.data?[index].status,
                        paidStatus:
                            cubit.orderStatusModel?.data?[index].paidStatus,
                        date: cubit.orderStatusModel?.data?[index].createdAt,
                        id: cubit.orderStatusModel?.data?[index].id,
                      ),
                    );
                  })),
        );
      },
    );
  }
}
