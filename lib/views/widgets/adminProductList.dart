
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/screens/editProduct.dart';

class AdminProductItem extends StatelessWidget {
   const AdminProductItem({Key? key,this.itemTitle,this.imgUrl,this.id}) : super(key: key);
   final String? id;
  final String? itemTitle;
  final String? imgUrl;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl!),
        ),title: Text(itemTitle!),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed:(){
              Get.to(()=>EditProduct(),arguments:id);
            } , icon: const Icon(Icons.edit,color: AppColors.iconClr,),),
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: AppColors.iconClr),),
          ],
        ),
      )
    );
  }
}
