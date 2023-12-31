import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.label,
    this.icon,
    this.obsecureText = false,
    this.inputType,
    this.onChanged,
    this.onTap,
  });
  final String hint;
  final String label;
  final IconData? icon;
  final bool? obsecureText;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: inputType,
        onChanged: onChanged,
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return 'field is required';
          }
          return null;
        },
        obscureText: obsecureText!,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              color: kPrimaryColor,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: kPrimaryColor,
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
