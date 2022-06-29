
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';
import 'package:shopping_app/views/widgets/buttonWidget.dart';
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
        titleSize: 22,titleTxtClr:AppColors.appBarTxtClr,
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      IconContainer(icon: Icons.remove,function: productController.decreaseCount,),
                       Obx(() => Text("${productController.amountOfItem.value}",
                           style:  const TextStyle(fontSize: 28.0)),),
                      IconContainer(icon: Icons.add,function: productController.increaseCount,),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                const Text("Description:",style: TextStyle(color: AppColors.txtClr,
                  fontSize: 27,),),
                 const SizedBox(height: 10,),
                Text(loadedProduct.desc,style: const TextStyle(color: AppColors.txtClr,
                  fontSize: 15,)),
                const SizedBox(height: 15,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //         height: 25,
                //         width: 25,
                //         child: Obx(() => Checkbox(
                //             checkColor: AppColors.checkedBoxClr,
                //             fillColor: MaterialStateColor.resolveWith(
                //                     (states) => AppColors.checkBoxClr),
                //             value: productController.isChecked.value,
                //             onChanged: (bool? val) {
                //               productController.isChecked.value = val!;
                //             }
                //         ),)
                //     ),
                //     const SizedBox(width: 5,),
                //     const Expanded(
                //       child: Text(
                //         'Agree to terms and conditions and wish to continue.',style:TextStyle(color: AppColors.txtClr,
                //         fontSize: 18,),
                //         textAlign: TextAlign.justify,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 15,),
                ButtonWidget(function: (){},btnTxt: "Add To Cart",btnClr: AppColors.btnClr,btnTxtClr: AppColors.btnTxtClr,)
              ],
            ),
          ),
        ),
      )
    );
  }
}


