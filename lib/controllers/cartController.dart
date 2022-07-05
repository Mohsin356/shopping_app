
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cartItemModel.dart';
import 'package:shopping_app/views/widgets/myCart.dart';


class CartController extends GetxController{
  final _cartItems=<CartItemModel>[].obs;
  final amountOfItem=1.obs;
  List<CartItemModel> get cartItems{
    return [..._cartItems];
  }
   get itemsCount=>_cartItems.length.obs;
  double get totalPrice=> _cartItems.fold(0, (sum, items) => sum + items.price!*amountOfItem.value);
  void addItems(String? id, String? title, double? price,int? quantity,){
    final itemExists=_cartItems.where((element) => element.id ==id);
    if(itemExists.isEmpty){
      _cartItems.add(CartItemModel(id: id,title: title,price: price! *amountOfItem.value,quantity: amountOfItem.value, ));
    }

  }

  myCart(){
    showModalBottomSheet(context: Get.context!,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        isScrollControlled: true,
        builder: (_){
          return const CartBottomSheet();
        },
    );

  }
  increaseCount(){
    amountOfItem.value++;
  }
  decreaseCount(){
    if(amountOfItem.value!=0){
      amountOfItem.value--;
    }
  }
   removeItem(CartItemModel items){
     _cartItems.remove(items);
  }

}