import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onValueChangedForRow});
  final Function(bool?) onValueChangedForRow;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3, // Scaling the checkbox
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Adding rounded corners
        ),
        fillColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor; // Green when checked
          }
          return Colors.white; // White when unchecked
        }),
        checkColor: Colors.white, // Color of the checkmark
        side: const BorderSide(
          style: BorderStyle.solid,
          width: 1.0,
          color: Color(0xffDDDFDF), // Border color
        ),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value;
            widget.onValueChangedForRow(value);
          });
        },
      ),
    );
  }
}
