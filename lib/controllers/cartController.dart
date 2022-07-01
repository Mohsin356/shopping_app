
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/widgets/myCart.dart';

import '../models/productModel.dart';

class CartController extends GetxController{
  final _cartListItems=<ProductModel>[].obs;

  List<ProductModel> get cartItemList{
    return [..._cartListItems];
  }
  void  set(List<ProductModel> cartItems){
    cartItems=cartItems;

  }
  int get itemsCount=> _cartListItems.length;
  double get totalPrice=> _cartListItems.fold(0, (sum, item) => sum + item.price!);
  addToCart(ProductModel product){
    _cartListItems.add(product);
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
}