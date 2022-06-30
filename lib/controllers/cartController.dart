
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cartItemModel.dart';
import 'package:shopping_app/views/widgets/myCart.dart';

class CartController extends GetxController{
  final _cartListItems=<CartItemModel>[].obs;

  List<CartItemModel> get cartItemList{
    return [..._cartListItems];
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