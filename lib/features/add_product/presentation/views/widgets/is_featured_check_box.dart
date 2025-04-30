import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAcepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'is featured item',
                  style: TextStyles.semiBold13(context).copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        CustomCheckBox(
          isChecked: isTermsAcepted,
          onChanged: (value) {
            isTermsAcepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
