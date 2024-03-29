
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';

import '../../controllers/cartController.dart';
class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final cartController= Get.find<CartController>();

  final String? titleTxt;
  final double? titleSize;
  final GestureDetector? leadingIcon;
  final VoidCallback? iconFunction;
   AppBarWidget({Key? key,this.titleTxt,this.titleSize,this.leadingIcon,this.iconFunction,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
      elevation: 0.0,
      titleSpacing: 0,
      leading: leadingIcon,
      actions: [
        Stack(
          children: [

            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: iconFunction,
            ),
            Positioned(
                right: 8,
                top: 5,
                child: cartController.itemsCount.value==0 ? Container()
                    :Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.iconBadgeClr,

                  ),
                  child: Center(child: Text('${cartController.itemsCount.value}',style: const TextStyle(fontSize: 12),)),
                )
            ),


          ],
        )
      ],
      iconTheme: const IconThemeData(
        color: AppColors.appBarIconClr,
      ),
      backgroundColor: AppColors.appBarBgClr,
      title: Text(titleTxt!,style: TextStyle(fontSize:titleSize,fontWeight: FontWeight.w600,color:AppColors.appBarTxtClr),),
    ));
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}