
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/orderController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appDrawer.dart';
import 'package:shopping_app/views/widgets/orderItem.dart';
import 'package:intl/intl.dart';

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
      body: ListView.builder(
          itemCount: orderController.orderList.length,
          itemBuilder: (context,index)=>OrderItem(title: orderController.orderList[index].amount,
        date:DateFormat('dd MM yyyy hh:mm').format(orderController.orderList[index].dateTime!),
      )),
    );
  }
}
