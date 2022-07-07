
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
class QuantityCount extends StatelessWidget {
  final VoidCallback? decCount;
  final VoidCallback? increaseCount;
  final int? txt;
  const QuantityCount({Key? key,this.txt,this.decCount,this.increaseCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(width: 30,),
      IconButton(
      onPressed: decCount,
      icon:  const Icon(Icons.remove,color: AppColors.iconClr),),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: myBoxDecoration(),
          child: Text('$txt'),
        ),
        IconButton(
          onPressed: increaseCount,
          icon:  const Icon(Icons.add,color: AppColors.iconClr),),
      ],
    );
  }
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.boxBorderClr,
      ),
    );
  }
}
