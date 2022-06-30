
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, this.txt}) : super(key: key);
  final String? txt;


  @override
  Widget build(BuildContext context) {
    return Text(txt!,style: const TextStyle(color: AppColors.txtClr,
      fontSize: 27,),);
  }
}
