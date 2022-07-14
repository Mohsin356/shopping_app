
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            title: const Text('hello User'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shop),
              title: const Text("Shop"),
            onTap: (){
              Get.to(ProductOverview());
            },
            ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment),
              title: const Text("Orders"),
            onTap: (){
              Get.to(OrdersScreen());
            },
            ),
        ],
      ),
    );
  }
}
