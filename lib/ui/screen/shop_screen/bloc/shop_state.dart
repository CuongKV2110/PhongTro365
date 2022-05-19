import '../../../../models/shop.dart';

abstract class ShopState {
  final List<Shop> data;

  ShopState({required this.data});
}

class ShopInitial extends ShopState {
  ShopInitial() : super(data: []);
}

class ShopLoading extends ShopState {
  ShopLoading() : super(data: []);
}

class ShopLoaded extends ShopState {
  final List<Shop> data;

  ShopLoaded({required this.data}) : super(data: data);
}

class ShopError extends ShopState {
  final String error;

  ShopError({required this.error}) : super(data: []);
}
