import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num expirationMonths, numberOfcalories, unitAmount;
  late double price;

  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
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
              CustomFromTextField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'product name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  price = double.parse(value!);
                },
                hintText: 'product price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                hintText: 'Experation months',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: 'Unit amount',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  numberOfcalories = num.parse(value!);
                },
                hintText: ' number of calories',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'product code',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFromTextField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'product description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(onChanged: (value) {
                isFeatured = value;
              }),
              const SizedBox(
                height: 16,
              ),
              ProductOrganicCheckbox(onChanged: (value) {
                isOrganic = value;
              }),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChange: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ProductEntity addProductInputEntity = ProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationMonths: expirationMonths.toInt(),
                        numberOfcalories: numberOfcalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic,
                        reviews: [],
                      );

                      context.read<AddProductCubit>().addProduct(
                            addProductInputEntity,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
