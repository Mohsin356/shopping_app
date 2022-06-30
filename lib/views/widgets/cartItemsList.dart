
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/utils/colors.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key,}) : super(key: key);
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
            // scrollDirection: Axis.vertical,
            itemCount: cartItemController.cartItemList.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    const SizedBox(height: 8,),
                  ],
                ),

                trailing:
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete,)),
              );
            })
      ],
    )
    );
  }
}