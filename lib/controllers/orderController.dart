
import 'package:get/get.dart';
import 'package:shopping_app/models/cartItemModel.dart';
import 'package:shopping_app/models/orderModel.dart';

class OrderController extends GetxController{

   final _ordersList = <OrderModel>[].obs;

  List<OrderModel> get orderList{
    return [..._ordersList];
  }

  void addOrder(List<CartItemModel> cartList, String total){

    _ordersList.insert(0, OrderModel(id: DateTime.now().toString(),amount: double.parse(total),dateTime: DateTime.now(),
        products: cartList));
  }
}