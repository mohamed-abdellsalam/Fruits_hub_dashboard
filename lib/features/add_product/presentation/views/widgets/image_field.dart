import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
    required this.onFileChange,
  });
  final ValueChanged<File?> onFileChange;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isloading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isloading,
      child: GestureDetector(
        onTap: () async {
          isloading = true;
          setState(() {});
          try {
            await pickImage();
          } on Exception catch (e) {}
          isloading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: imageFile != null
                    ? Image.file(
                        imageFile!,
                      )
                    : const Icon(
                        Icons.add_a_photo,
                        size: 100,
                      ),
              ),
            ),
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                onPressed: () {
                  imageFile = null;
                  widget.onFileChange(imageFile);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);

    widget.onFileChange(imageFile);
  }
}
