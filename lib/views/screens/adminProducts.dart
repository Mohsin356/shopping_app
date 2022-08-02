
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/screens/editProduct.dart';
import 'package:shopping_app/views/widgets/adminProductList.dart';
import 'package:shopping_app/views/widgets/appDrawer.dart';

class AdminProducts extends StatelessWidget {
   AdminProducts({Key? key}) : super(key: key);
  final productController=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Manage Products',style: TextStyle(color: AppColors.appBarTxtClr,fontSize: 22,fontWeight: FontWeight.w600),),
        backgroundColor: AppColors.appBarBgClr,
        iconTheme: const IconThemeData(
          color: AppColors.appBarIconClr,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: AppColors.iconClr,)),
        ],
      ),
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(itemCount: productController.items.length,
        itemBuilder: (_,index)=>Column(
          children: [
            AdminProductItem(imgUrl: productController.items[index].imgUrl,
              itemTitle: productController.items[index].title,
            editFunc: (){
              Get.to(EditProduct());
            },),
            const Divider(),
          ],
        ),
      ),
      ),
    );
  }
}
