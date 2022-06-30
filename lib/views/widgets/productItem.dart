
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/screens/productDetail.dart';
class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  const ProductItem({Key? key, this.id, this.title, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            footer: GridTileBar(
              title: Center(child: Text(title!,style: const TextStyle(fontSize: 16,color: AppColors.gridTileTitleClr,fontWeight: FontWeight.bold),)),
              backgroundColor: AppColors.gridTileFooterBg,
            ),
            child:  GestureDetector(
              child: Hero(
                  tag: id!,
                  child: Image.network(imageUrl!,fit: BoxFit.cover,)),
              onTap: (){
                Get.to(()=>ProductDetail(),arguments:id);
              },
            )
        ),
      ),
    );
  }
}
