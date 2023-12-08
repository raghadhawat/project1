import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/models/add_order_model.dart';
import 'package:pharma_track/widgets/custom_addorder_button.dart';
import 'package:pharma_track/widgets/custom_drop_down.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class MedicineForm extends StatefulWidget {
  MedicineForm({
    super.key,
    required this.name,
  });
  String name;
  @override
  State<MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, quantity;
  @override
  Widget build(BuildContext context) {
    List<String> names = [];
    BlocProvider.of<AllApiCubit>(context).allMedicine(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AllMedicineSuccess) {
          for (var name in AllApiCubit.get(context).allMedicineModel!.data!) {
            names.add(name.scientificName!);
            names.add(name.tradeName!);
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomDropDown(
                name: names,
                onChanged: (value) {
                  name = value;
                },
                hint: widget.name,
                label: widget.name,
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
                    title: 'Add To Order',
                    isLoading: state is AddOrderLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        name = name ?? widget.name;
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
      },
    );
  }
}
