
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';

class ProductDetail extends StatelessWidget {
   const ProductDetail({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;
    return Scaffold(
      appBar:  AppBarWidget(appBarBgClr: AppColors.appBarBgClr,titleTxt: data[0],
        titleTxtClr:AppColors.appBarTxtClr,implyLeading: true,),
        extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: Get.width,
            child: Column(
              children: [
                Card(
                  elevation: 6,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(data[1],fit: BoxFit.contain,)),
                ),
                const SizedBox(height: 15,),
                const Text("Description:",style: TextStyle(color: AppColors.txtClr,
                  fontSize: 27,),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
