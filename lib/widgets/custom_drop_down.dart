import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    this.obsecureText = false,
    this.inputType,
    this.onChanged,
    this.onTap,
    required this.name,
  });
  final String hint;
  final String label;
  final IconData icon;
  final bool? obsecureText;
  final TextInputType? inputType;
  final dynamic Function(String?)? onChanged;
  final void Function()? onTap;
  final List<String> name;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownSearch<String>(
        popupProps: PopupProps.modalBottomSheet(
          modalBottomSheetProps: ModalBottomSheetProps(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          fit: FlexFit.tight,
          showSearchBox: true,
          showSelectedItems: true,
        ),
        items: widget.name,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            focusColor: kPrimaryColor,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            labelText: widget.label,
            labelStyle: const TextStyle(color: kPrimaryColor),
            hintStyle: const TextStyle(color: kPrimaryColor),
            hintText: widget.hint,
          ),
        ),
        onChanged: widget.onChanged,
        selectedItem: null,
      ),
    );
  }
}
