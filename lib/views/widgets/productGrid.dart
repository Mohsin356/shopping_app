
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/views/widgets/productItem.dart';
class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productItemController= Get.put(ProductController());
    final productListItem=productItemController.items;
    return LayoutBuilder(builder: (context, constraints) {
      return
        GridView.builder(
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
                  id: productListItem[index].id,
                  imageUrl: productListItem[index].imgUrl,
                  title: productListItem[index].title,
                );
            });
    });
  }
}