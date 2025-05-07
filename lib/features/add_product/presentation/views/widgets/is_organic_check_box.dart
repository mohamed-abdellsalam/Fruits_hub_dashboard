import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';

class ProductOrganicCheckbox extends StatefulWidget {
  const ProductOrganicCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<ProductOrganicCheckbox> createState() => _ProductOrganicCheckboxState();
}

class _ProductOrganicCheckboxState extends State<ProductOrganicCheckbox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'is organic product ?',
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
          isChecked: isOrganic,
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
