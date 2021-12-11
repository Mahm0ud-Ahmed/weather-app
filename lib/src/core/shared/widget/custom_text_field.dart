import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Widget? suffix;
  final Function()? onTab;
  final Function(String?)? onChange;

  const CustomTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.suffix,
    this.label,
    this.hint,
    this.onTab,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Theme.of(context).cardColor,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        hintText: hint,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade300,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onTap: onTab,
      onChanged: onChange,
    );
  }
}
