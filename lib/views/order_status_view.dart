import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/order_status_card.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static String id = 'OrderStatusView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AppBarText(),
          backgroundColor: kPrimaryColor,
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const OrderStatusCard();
            }));
  }
}
