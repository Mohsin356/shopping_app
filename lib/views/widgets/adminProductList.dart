
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';

class AdminProductItem extends StatelessWidget {
   const AdminProductItem({Key? key,this.itemTitle,this.imgUrl,this.editFunc,this.deleteFunc}) : super(key: key);
  final String? itemTitle;
  final String? imgUrl;
  final VoidCallback? editFunc;
  final VoidCallback? deleteFunc;

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
            IconButton(onPressed: editFunc, icon: const Icon(Icons.edit,color: AppColors.iconClr,),),
            IconButton(onPressed: deleteFunc, icon: const Icon(Icons.delete,color: AppColors.iconClr),),
          ],
        ),
      )
    );
  }
}
