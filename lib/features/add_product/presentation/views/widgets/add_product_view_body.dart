import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';

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
          child: const Column(
            children: [
              CustomFromTextField(
                hintText: 'product name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                hintText: 'product price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                hintText: 'product code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                hintText: 'product description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
