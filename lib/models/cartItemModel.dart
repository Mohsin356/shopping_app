
import 'package:get/get.dart';

class CartItemModel{
  final String? id;
  final String? title;
  final double? price;
  RxInt? quantity;
  final double? totalPrice;

  CartItemModel({this.id, this.title,this.quantity,this.price ,this.totalPrice,});
}