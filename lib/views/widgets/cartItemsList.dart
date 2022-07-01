
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/utils/colors.dart';

class CartItemList extends StatelessWidget {
  CartItemList({Key? key,}) : super(key: key);
  final cartItemController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => cartItemController.cartItemList.isEmpty ?
    Column(
      children: const[
        SizedBox(height: 40,),
        Center(
          child:  Text("No Items Added Yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
        )
      ],
    )
        :Column(
      children: [
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: cartItemController.cartItemList.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(cartItemController.cartItemList[index].imgUrl.toString(),fit: BoxFit.contain,)),
              );
            })
      ],
    )
    );
  }
}