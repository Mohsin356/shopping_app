
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
class IconContainer extends StatelessWidget {
  final VoidCallback? function;
  final Icon? icon;
  const IconContainer({
    Key? key,this.function,this.icon
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: function,
        icon: const Icon(Icons.add,color: AppColors.iconClr),
      ),
    );
  }
}