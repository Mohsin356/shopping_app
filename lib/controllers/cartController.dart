
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/cartItemModel.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/myCart.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CartController extends GetxController{


  var _cartItems={}.obs;
  Map<String, CartItemModel> get cartItems{
    return {..._cartItems};
  }
   RxInt get itemsCount{
    return _cartItems.length.obs;
   }
   double get totalPrice{
    var total=0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price* cartItem.quantity.value;
    });
    return total;
   }
  // double get totalPrice=> _cartItems.fold(0, (sum, items) => sum + items.price!*items.quantity!.value);
  // void addItems(String? id, String? title, double? price,RxInt? itemQuantity){
  //   final itemExists=_cartItems.where((element) => element.id ==id);
  //   if(itemExists.isEmpty) {
  //     _cartItems.add(CartItemModel(
  //         id: id, title: title, price: price!, quantity: itemQuantity));
  //   }
  // }
  void addItems(String productId,double itemPrice,String itemTitle,RxInt itemQuantity){
    if(_cartItems.containsKey(productId)){
      Fluttertoast.showToast(
          msg: 'Product Already Added',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: 'center',
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.toastBg,
          textColor: AppColors.txtClrWhite,
          fontSize: 16.0);
    }
    else{
      _cartItems.putIfAbsent(productId,
              () => CartItemModel(id: DateTime.now().toString(),
                  price: itemPrice,
                  quantity: itemQuantity,
                  title:itemTitle ));
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

   removeItem(String productId){
     _cartItems.remove(productId);
     update();
  }
 clearItems(){
    _cartItems={}.obs;
    update();
}
}