
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final Color? appBarBgClr;
  final String? titleTxt;
  final Color? titleTxtClr;
  final bool? implyLeading;
  final double? titleSize;
  final GestureDetector? leadingIcon;
  const AppBarWidget({Key? key,this.appBarBgClr,this.titleTxt,this.titleTxtClr,this.implyLeading,this.titleSize,this.leadingIcon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0,
      leading: leadingIcon,
      actions: [
         IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: (){},
        ),
      ],
      iconTheme: const IconThemeData(
        color: AppColors.appBarIconClr,
      ),
      backgroundColor: appBarBgClr,
      automaticallyImplyLeading: implyLeading!,
      title: Text(titleTxt!,style: TextStyle(fontSize:titleSize,fontWeight: FontWeight.w600,color:titleTxtClr),),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}