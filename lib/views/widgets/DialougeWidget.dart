
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
       SizedBox(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [

               GestureDetector(
                 onTap: confirmed,
                 child: const Text('Yes',style: TextStyle(color: AppColors.txtClr),),
               ),
               const SizedBox(width: 20,),
               GestureDetector(
                 onTap: notConfirmed,
                 child: const Text('No',style: TextStyle(color: AppColors.txtClr),),
               ),

             ],
           ),
         ),
       )
      ],

    );
  }
}
