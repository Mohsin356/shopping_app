
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';

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
            padding: const EdgeInsets.only(left: 8.0,right: 0.8,top: 10),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *0.4,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Card(
                      elevation: 6,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(loadedProduct.imgUrl,fit: BoxFit.contain,)),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("Description:",style: TextStyle(color: AppColors.txtClr,
                  fontSize: 27,),),
                 const SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Text(loadedProduct.desc,style: const TextStyle(color: AppColors.txtClr,
                     fontSize: 18,),),
                 ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
