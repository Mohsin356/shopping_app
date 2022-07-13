
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:get/get.dart';

class QuantityCount extends StatelessWidget {
  RxInt? qtyOfProduct;
  QuantityCount({Key? key,this.qtyOfProduct,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(width: 30,),
      IconButton(
      onPressed: (){
        if(qtyOfProduct != 0){
          qtyOfProduct = (qtyOfProduct! - 1)!;
        }
      },
      icon:  const Icon(Icons.remove,color: AppColors.iconClr),),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: myBoxDecoration(),
          child: Obx(() => Text('$qtyOfProduct')),
        ),
        IconButton(
          onPressed:(){
            qtyOfProduct = (qtyOfProduct! + 1)!;
          },
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
