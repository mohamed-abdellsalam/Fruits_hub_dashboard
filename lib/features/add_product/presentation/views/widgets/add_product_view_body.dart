import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const CustomFromTextField(
                hintText: 'product name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFromTextField(
                hintText: 'product price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFromTextField(
                hintText: 'product code',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFromTextField(
                hintText: 'product description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(onChanged: (value) {}),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChange: (image) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
