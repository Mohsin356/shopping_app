
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({Key? key, this.labelTxt, this.inputType, this.inputAction,
    this.focusNode, this.function,this.maxLines,this.controller,
    this.functionSaveForm,this.validator,this.initVal}) : super(key: key);
  final String? labelTxt;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? function;
  final String? Function(String?)? functionSaveForm;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextEditingController? controller;
  final String? initVal;
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
      textInputAction: inputAction,
      keyboardType: inputType,
      maxLines: maxLines,
      focusNode: focusNode,
      onFieldSubmitted: function,
      controller: controller,
      onSaved: functionSaveForm,
      validator: validator,
      initialValue: initVal,
    );
  }
}
