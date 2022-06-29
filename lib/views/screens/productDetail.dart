
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';
import 'package:shopping_app/views/widgets/iconContainerWidget.dart';
import '../../controllers/productController.dart';


class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key,}) : super(key: key);
   final productController=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;
     var loadedProduct=productController.findItemById(data);
    return Scaffold(
      appBar:  AppBarWidget(appBarBgClr: AppColors.appBarBgClr,titleTxt: loadedProduct.title,
        titleSize: 22,titleTxtClr:AppColors.appBarTxtClr,implyLeading: true,),
        extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconContainer(icon: const Icon(Icons.remove),function: productController.decreaseCount,),
                       Obx(() => Text("${productController.amountOfItem.value}",
                           style:  const TextStyle(fontSize: 28.0)),),
                      IconContainer(icon: const Icon(Icons.add),function: productController.increaseCount,),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("Description:",style: TextStyle(color: AppColors.txtClr,
                  fontSize: 27,),),
                 const SizedBox(height: 10,),
                 Text(loadedProduct.desc,style: const TextStyle(color: AppColors.txtClr,
                   fontSize: 18,),),
              ],
            ),
          ),
        ),
      )
    );
  }
}


