import 'package:flutter/material.dart';
import 'package:pharma_track/widgets/custom_addorder_button.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class AddOrderButtomSheeet extends StatelessWidget {
  const AddOrderButtomSheeet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: "Medicine Name ",
              label: "Medicine Name ",
              icon: Icons.medication_outlined,
            ),
            CustomTextFormField(
              hint: 'Quantity',
              label: 'Quantity',
              icon: Icons.input,
            ),
            SizedBox(
              height: 40,
            ),
            CustomAddOrderButton(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
