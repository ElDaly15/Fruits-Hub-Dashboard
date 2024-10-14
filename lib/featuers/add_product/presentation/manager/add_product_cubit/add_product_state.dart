part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductFailuer extends AddProductState {
  final String errorMsg;

  AddProductFailuer({required this.errorMsg});
}

final class AddProductLoading extends AddProductState {}
