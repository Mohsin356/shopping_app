
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/productItem.dart';
class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productItemController= Get.put(ProductController());
    final productListItem=productItemController.items;
    return productListItem.isEmpty? const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child:  Text("No Products Added Yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
      ),
    ) :
    LayoutBuilder(builder: (context, constraints) {
      return
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
          ),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 700 ? 3 : 2,
              ),
              itemCount: productListItem.length,
              itemBuilder: (BuildContext context, index) {
                return
                  ProductItem(
                    id: productListItem[index].id!,
                    imageUrl: productListItem[index].imgUrl,
                    title: productListItem[index].title,
                  );
              }),
        );
    });
  }
}