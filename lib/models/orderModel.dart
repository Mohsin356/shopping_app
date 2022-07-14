
import 'cartItemModel.dart';

class OrderModel{
  final String? id;
  final double? amount;
  final List<CartItemModel>? products;
  final DateTime? dateTime;

  OrderModel({this.id, this.amount, this.products, this.dateTime});

}