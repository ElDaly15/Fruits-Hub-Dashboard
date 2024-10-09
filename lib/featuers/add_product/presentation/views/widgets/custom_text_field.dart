import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.onChanged,
      required this.obscureText,
      required this.isPassword,
      required this.hintText,
      required this.keyboardType,
      required this.maxLines});

  final Function(String)? onChanged;
  bool obscureText = false;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor:
              Color(0xffB2DFDB), // Highlight color for selected text
          selectionHandleColor: Color(0xff1B5E37), // Handle color
        ),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          if (value.length < 8 && widget.isPassword) {
            return 'يجب أن تكون كلمة المرور على الأقل 8 أحرف';
          }

          // Check for at least one special character

          return null;
        },
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isPassword,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                  onPressed: () {
                    widget.obscureText = !widget.obscureText;
                    setState(() {});
                  },
                  icon: widget.obscureText
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xffC9CECF),
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xffC9CECF),
                        )),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE6E9EA)),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(108, 71, 71, 71)),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        cursorColor: const Color(0xff1B5E37),
        style: TextStyles.semiBold16.copyWith(color: Colors.black),
      ),
    );
  }
}
