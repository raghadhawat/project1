import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/custom_addorder_button.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class AddOrderForm extends StatefulWidget {
  const AddOrderForm({
    super.key,
  });

  @override
  State<AddOrderForm> createState() => _AddOrderFormState();
}

class _AddOrderFormState extends State<AddOrderForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, quantity;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) {
              name = value;
            },
            hint: "Medicine Name ",
            label: "Medicine Name ",
            icon: Icons.medication_outlined,
          ),
          CustomTextFormField(
            onChanged: (value) {
              quantity = value;
            },
            hint: 'Quantity',
            label: 'Quantity',
            icon: Icons.input,
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<AddOrderCubit, AddOrderState>(
            builder: (context, state) {
              return CustomAddOrderButton(
                isLoading: state is AddOrderLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var addOrderModel = AddOrderModel(
                      name: name!,
                      quantity: quantity!,
                      tName: "fsd",
                      image: kLogo,
                    );
                    BlocProvider.of<AddOrderCubit>(context)
                        .addOrder(addOrderModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
