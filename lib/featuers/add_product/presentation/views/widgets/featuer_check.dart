import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/custom_check_box.dart';

class PrivacyCheck extends StatefulWidget {
  const PrivacyCheck(
      {super.key,
      required this.onValueChanged,
      required this.onTap,
      required this.title});
  final Function(bool?) onValueChanged;
  final String title;
  final Function()? onTap;
  @override
  State<PrivacyCheck> createState() => _CheckBoxForPrivacyState();
}

class _CheckBoxForPrivacyState extends State<PrivacyCheck> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-2, 0),
      child: Row(
        children: [
          CustomCheckBox(
            onValueChangedForRow: (value) {
              setState(() {
                widget.onValueChanged(value);
              });
            },
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: widget.title,
                    style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xff949D9E), fontFamily: 'Cairo'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
