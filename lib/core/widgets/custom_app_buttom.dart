import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';

// ignore: camel_case_types
class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1B5E37),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          minimumSize: const Size(double.infinity, 50)),
      child: Text(
        text,
        style: TextStyles.bold16.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
