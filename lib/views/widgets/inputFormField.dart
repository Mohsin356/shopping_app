
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({Key? key, this.labelTxt, this.inputType, this.inputAction, this.focusNode, this.function,this.maxLines}) : super(key: key);
  final String? labelTxt;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? function;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.cursorClr,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.lblTxtClr),
          labelText: labelTxt,
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color:AppColors.txtFieldFocused,)
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      maxLines: maxLines,
      focusNode: focusNode,
      onFieldSubmitted: function,
    );
  }
}
