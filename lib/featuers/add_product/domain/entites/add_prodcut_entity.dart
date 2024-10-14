import 'dart:io';

class AddProdcutEntity {
  final String name;
  final String price;
  final String code;
  final String description;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;

  AddProdcutEntity(
      {required this.name,
      required this.price,
      required this.code,
      required this.description,
      required this.imageFile,
      required this.isFeatured,
      this.imageUrl});
}
