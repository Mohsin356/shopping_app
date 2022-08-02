
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/screens/adminProducts.dart';
import 'package:shopping_app/views/screens/ordersScreen.dart';
import 'package:shopping_app/views/screens/productOverview.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black,
            title: const Text('Hello User'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.shop,
              color: AppColors.iconClr,),
              title: const Text("Shop"),
            onTap: (){
              Get.to(ProductOverview());
            },
            ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
                color: AppColors.iconClr),
              title: const Text("Orders"),
            onTap: (){
              Get.to(OrdersScreen());
            },
            ),
          const Divider(),
          ListTile(
            leading: const Icon(
                Icons.edit,
                color: AppColors.iconClr),
            title: const Text("Manage Products"),
            onTap: (){
              Get.to(AdminProducts());
            },
          ),
        ],
      ),
    );
  }
}
