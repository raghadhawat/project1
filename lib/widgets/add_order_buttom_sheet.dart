import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/custom_addorder_button.dart';
import 'package:pharma_track/widgets/custom_drop_down.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class AddOrderButtomSheeet extends StatefulWidget {
  const AddOrderButtomSheeet({super.key});

  @override
  State<AddOrderButtomSheeet> createState() => _AddOrderButtomSheeetState();
}

class _AddOrderButtomSheeetState extends State<AddOrderButtomSheeet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? name, quantity;

  @override
  Widget build(BuildContext context) {
    List<String> names = [];
    BlocProvider.of<AllApiCubit>(context).allMedicine(context);
    return BlocConsumer<AllApiCubit, AllApiState>(listener: (context, state) {
      if (state is AllMedicineSuccess) {
        for (var name in AllApiCubit.get(context).allMedicineModel!.data!) {
          names.add(name.scientificName!);
        }
      }
    }, builder: (context, state) {
      return BlocProvider(
        create: (context) => AddOrderCubit(),
        child: BlocConsumer<AddOrderCubit, AddOrderState>(
            listener: (context, state) {
          if (state is AddOrderFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddOrderSuccess) {
            BlocProvider.of<OrderCubit>(context).fetchAllOrder();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddOrderLoading ? true : false,
              child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: 8,
                        left: 8,
                        right: 8,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        CustomDropDown(
                          name: names,
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
                          icon: Icons.add,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        BlocBuilder<AddOrderCubit, AddOrderState>(
                          builder: (context, state) {
                            return CustomAddOrderButton(
                              title: 'Add To Order',
                              isLoading:
                                  state is AddOrderLoading ? true : false,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  var addOrderModel = AddOrderModel(
                                    name: name!,
                                    quantity: quantity!,
                                    tName: "fsd",
                                    image: kLogo2,
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
                  ))));
        }),
      );
    });
  }
}
