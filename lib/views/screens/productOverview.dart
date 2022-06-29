
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';
import 'package:shopping_app/views/widgets/productGrid.dart';
class ProductOverview extends StatelessWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWidget(titleTxt: 'Shop',titleSize: 26,
        appBarBgClr: AppColors.appBarBgClr,
        titleTxtClr:AppColors.appBarTxtClr,
        leadingIcon: GestureDetector(
        onTap: () { },
          child: const Icon(
          Icons.menu,
          ),
      ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      elevation: 6,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(Assets.bannerImgUrl,fit: BoxFit.contain,)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                   const Padding(
                     padding: EdgeInsets.only(left: 8.0),
                     child: Text("Products",style: TextStyle(color: AppColors.txtClr,fontSize: 27,)),
                   ),
                  const SizedBox(height: 15,),
                  const ProductGrid(),
                ],
              ),
            ),
          ))
    );
  }
}

