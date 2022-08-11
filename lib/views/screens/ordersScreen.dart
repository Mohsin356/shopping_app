
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/orderController.dart';
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
         body: FutureBuilder(future: orderController.fetchOrder(),
           builder: (context,dataSnapshot){
           if(dataSnapshot.connectionState==ConnectionState.waiting){
             return const Center(
               child: CircularProgressIndicator(
                 color: AppColors.circularProgressClr,
               ),
             );
           }
           if(dataSnapshot.error!=null){
             return AlertDialog(
               title: const Text("An error occurred"),
               content: const Text('Something went wrong',style: TextStyle(color: AppColors.txtClr),),
               actions: [
                 SizedBox(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                     child: GestureDetector(
                       onTap: (){
                         Get.back();
                       },
                       child: const Text('Ok',style: TextStyle(color: AppColors.txtClr),),
                     ),
                   ),
                 )
               ],
             );
           }
           else{
             return orderController.orderList.isEmpty ?
             const Center(
               child:  Text("No Orders added yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
             ):
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8),
               child: ListView.builder(
                 itemCount: orderController.orderList.length,
                 itemBuilder: (context,index)=>OrderListItems(order: orderController.orderList[index]),
               ),
             );
           }
           },)

     );
   }
}




