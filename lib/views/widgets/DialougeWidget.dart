
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';

class DialougeWidget extends StatelessWidget {
  const DialougeWidget({Key? key,this.titleTxt,this.contentTxt,this.contextTxtClr,this.confirmed,this.notConfirmed}) : super(key: key);
  final String? titleTxt;
  final String? contentTxt;
  final Color? contextTxtClr;
  final VoidCallback? confirmed;
  final VoidCallback? notConfirmed;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleTxt!), content: Text(contentTxt!,style: TextStyle(color: contextTxtClr),),
      actions: [
        ElevatedButton(onPressed: confirmed,
            style:ElevatedButton.styleFrom(
              primary: AppColors.btnClr,onPrimary: AppColors.btnTxtClr,)
            ,child: const Text('Yes')),
        ElevatedButton(onPressed: notConfirmed,
          style:ElevatedButton.styleFrom(
            primary: AppColors.btnClr,onPrimary: AppColors.btnTxtClr,),
          child: const Text('No'),
        ),


      ],

    );
  }
}
