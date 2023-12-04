import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/custom_addorder_button.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class EditOrderButtomSheeet extends StatefulWidget {
  const EditOrderButtomSheeet({super.key, required this.order});
  final AddOrderModel order;

  @override
  State<EditOrderButtomSheeet> createState() => _EditOrderButtomSheeetState();
}

class _EditOrderButtomSheeetState extends State<EditOrderButtomSheeet> {
  String? name, quantity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) {
                name = value;
              },
              hint: widget.order.name,
              label: widget.order.name,
              icon: Icons.medication_outlined,
            ),
            CustomTextFormField(
              onChanged: (value) {
                quantity = value;
              },
              hint: widget.order.quantity,
              label: widget.order.quantity,
              icon: Icons.input,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomAddOrderButton(
              title: 'Edit',
              onTap: () {
                widget.order.name = name ?? widget.order.name;
                widget.order.quantity = quantity ?? widget.order.quantity;
                widget.order.save();
                BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
