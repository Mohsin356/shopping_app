
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/models/cartItemModel.dart';
import 'package:shopping_app/models/orderModel.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/utils/urls.dart';

class OrderController extends GetxController{

   final _ordersList = <OrderModel>[].obs;

  List<OrderModel> get orderList{
    return [..._ordersList];
  }
  Future<void>fetchOrder()async{
   try{
     final response=await http.get(Uri.parse(Url.orderUrl));
     final loadedOrder=<OrderModel>[];
     final extractedOrder=json.decode(response.body) as Map<String,dynamic>;
     extractedOrder.forEach((orderId, orderData) {
       loadedOrder.add(OrderModel(
           id: orderId,
           amount: double.parse(orderData['amount']),
           dateTime: DateTime.parse(orderData['dateTime']),
           products: (orderData['products'] as List<dynamic>).map((item) =>
               CartItemModel(
                 id: item['id'],
                 price: item['price'],
                 title: item['title'],
                 quantity: item['quantity'],
               )).toList()
       ));
     });
     _ordersList.value=loadedOrder.reversed.toList();
   }
   catch (err){
     print(err);
   }
  }
  Future<void> addOrder(List<CartItemModel> cartList, String total)async{
    final timeStamp=DateTime.now();
    final response= await http.post(Uri.parse(Url.orderUrl),
    body: json.encode(
      {
        'amount':total,
        'dateTime':timeStamp.toIso8601String(),
        'products':cartList.map((e) => {
          'id':e.id,
          'title':e.title,
          'quantity':e.quantity,
          'price':e.price
        }).toList()
      }
    ));
    

    _ordersList.insert(0,
        OrderModel(
            id: json.decode(response.body)['name'],
            amount: double.parse(total), 
            dateTime: timeStamp, 
            products: cartList));
  }
}