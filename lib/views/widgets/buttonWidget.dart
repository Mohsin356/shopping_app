
import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key,this.function, this.btnTxt,this.btnClr,this.btnTxtClr}) : super(key: key);
  final VoidCallback? function;
  final String? btnTxt;
  final Color? btnTxtClr;
  final Color? btnClr;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function,
    style:ElevatedButton.styleFrom(
      primary: btnClr,onPrimary: btnTxtClr,
      minimumSize: const Size.fromHeight(50),
    ), child: Text(btnTxt!,style: const TextStyle(fontSize: 18),));
  }
}
