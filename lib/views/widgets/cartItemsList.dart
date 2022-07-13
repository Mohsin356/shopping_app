
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/buttonWidget.dart';
import 'package:shopping_app/views/widgets/quantityCountWidget.dart';

class CartItemList extends StatelessWidget {
  CartItemList({Key? key,}) : super(key: key);
  final cartItemController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return cartItemController.cartItems.isEmpty ?
    Column(
      children: const[
        SizedBox(height: 40,),
        Center(
          child:  Text("No Items Added Yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
        )
      ],
    )
        :Obx(() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: cartItemController.cartItems.length,
              itemBuilder: (context,index){
                return ListTile(
                    leading: Text("${cartItemController.cartItems[index].title}",style: const TextStyle(fontSize: 18),),
                    title:  QuantityCount(qtyOfProduct: cartItemController.cartItems[index].quantity!,),
                    trailing: IconButton(onPressed: (){
                      cartItemController.removeItem(cartItemController.cartItems[index]);
                    },icon: const Icon(Icons.delete,color: AppColors.iconClr,),)
                );
              }),
          const SizedBox(height: 15,),
          Text("Total: ${cartItemController.totalPrice.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 15,),
          ButtonWidget(btnTxt: "Proceed To Payment",btnTxtClr: AppColors.btnTxtClr,btnClr: AppColors.btnClr,function: (){
          },),
        ],
      ),

    ));
  }
}