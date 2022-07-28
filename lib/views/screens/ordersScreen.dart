
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/controllers/orderController.dart';
import 'package:shopping_app/models/orderModel.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appDrawer.dart';
import 'package:shopping_app/views/widgets/orderListItem.dart';


class OrdersScreen extends StatelessWidget {
   OrdersScreen({Key? key}) : super(key: key);
   final orderController= Get.put(OrderController());

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           elevation: 0.0,
           title: const Text('Your Orders',style: TextStyle(color: AppColors.appBarTxtClr,fontSize: 22,fontWeight: FontWeight.w600),),
           backgroundColor: AppColors.appBarBgClr,
           iconTheme: const IconThemeData(
             color: AppColors.appBarIconClr,
           ),
         ),
         drawer: const AppDrawer(),
         extendBodyBehindAppBar: true,
         backgroundColor: AppColors.appBgClr,
         body: orderController.orderList.isEmpty ?
         const Center(
           child:  Text("No Orders added yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
         ):
         ListView.builder(
           itemCount: orderController.orderList.length,
           itemBuilder: (context,index)=>OrderListItems(order: orderController.orderList[index]),

         )

     );
   }
   // Widget orderListItems(OrderModel order){
   //   return Padding(
   //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
   //     child: Card(
   //       elevation: 2,
   //       child: ExpansionTile(title: Text('Rs ${order.amount!.toStringAsFixed(2)}',
   //       ),
   //         subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime!),
   //           style: const TextStyle(color: AppColors.hintTxtClr,fontSize: 12),),
   //         children: order.products!.map((e) =>
   //             Padding(padding: const EdgeInsets.all(10),
   //               child:  Obx(() => Row(
   //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
   //                 children: [
   //                   Text(e.title!),
   //                   Text('${e.quantity!.value} x ${e.price}')
   //                 ],
   //               ),))
   //         ).toList(),
   //       ),
   //     ),
   //   );
   // }
}




