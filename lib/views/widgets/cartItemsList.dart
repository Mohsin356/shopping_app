
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/buttonWidget.dart';

class CartItemList extends StatelessWidget {
  CartItemList({Key? key,}) : super(key: key);
  final cartItemController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => cartItemController.cartItems.isEmpty ?
    Column(
      children: const[
        SizedBox(height: 40,),
        Center(
          child:  Text("No Items Added Yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
        )
      ],
    )
        :Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
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
                  title: Center(child: Text("Rs ${cartItemController.cartItems[index].price}")),
                  trailing: Text("Quantity: ${cartItemController.cartItems[index].quantity}"),
                );
              }),
          const SizedBox(height: 15,),
          Text("Total: ${cartItemController.totalPrice.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 15,),
          ButtonWidget(btnTxt: "Proceed To Payment",btnTxtClr: AppColors.btnTxtClr,btnClr: AppColors.btnClr,function: (){},),
      ],
    ),
        )
    );
  }
}