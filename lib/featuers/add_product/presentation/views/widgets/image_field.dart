import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});

  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final ImagePicker picker = ImagePicker();

          final XFile? image =
              await picker.pickImage(source: ImageSource.gallery);

          fileImage = File(image!.path);
          widget.onFileChanged(fileImage!);
          setState(() {});
        } catch (e) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('There was an error picking an image'),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: fileImage == null
                ? const Icon(
                    Icons.image_outlined,
                    size: 180,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      fileImage!,
                    ),
                  ),
          ),
          Visibility(
            visible: fileImage != null,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onFileChanged(null);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          )
        ],
      ),
    );
  }
}
