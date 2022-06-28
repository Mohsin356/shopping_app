
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final Color? appBarBgClr;
  final String? titleTxt;
  final Color? titleTxtClr;
  final bool? implyLeading;
  const AppBarWidget({Key? key,this.appBarBgClr,this.titleTxt,this.titleTxtClr,this.implyLeading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: AppColors.appBarIconClr, //change your color here
      ),
      backgroundColor: appBarBgClr,
      automaticallyImplyLeading: implyLeading!,
      title: Text(titleTxt!,style: TextStyle(fontSize:24,fontWeight: FontWeight.w900,color:titleTxtClr),),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}