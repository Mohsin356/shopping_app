
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';
import 'package:shopping_app/views/widgets/buttonWidget.dart';
import 'package:shopping_app/views/widgets/headingText.dart';
import 'package:shopping_app/views/widgets/iconContainerWidget.dart';
import '../../controllers/productController.dart';


class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key,}) : super(key: key);
   final productController=Get.find<ProductController>();
   final cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {

    String data = Get.arguments;
     var loadedProduct=productController.findItemById(data);
    return Scaffold(
      appBar:  AppBarWidget(appBarBgClr: AppColors.appBarBgClr,titleTxt: loadedProduct.title,
        titleSize: 22,titleTxtClr:AppColors.appBarTxtClr,
        iconFunction: cartController.myCart,
        leadingIcon: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),),
        extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    elevation: 6,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                            tag: data,
                            child: Image.network(loadedProduct.imgUrl,fit: BoxFit.contain,))),
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Rs ${loadedProduct.price}",style:  const TextStyle(fontSize: 28.0),),
                const SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconContainer(icon: Icons.remove,function: productController.decreaseCount,),
                       Obx(() => Text("${productController.amountOfItem.value}",
                           style:  const TextStyle(fontSize: 28.0)),),
                      IconContainer(icon: Icons.add,function: productController.increaseCount,),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                const HeadingText(txt:"Description:"),
                 const SizedBox(height: 10,),
                Text(loadedProduct.desc,style: const TextStyle(color: AppColors.txtClr,
                  fontSize: 15,)),
                const SizedBox(height: 20,),
                Obx(() => productController.amountOfItem.value==0 ?
                const ButtonWidget(function: null,btnTxt: "Add To Cart",):
                ButtonWidget(function: (){
                  cartController.addItems(loadedProduct.id,
                      loadedProduct.title, loadedProduct.price, productController.amountOfItem.value);
                },btnTxt: "Add To Cart",btnClr: AppColors.btnClr,btnTxtClr: AppColors.btnTxtClr,))
              ],
            ),
          ),
        ),
      )
    );
  }
}


