
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/productItem.dart';
class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final productItemController= Get.put(ProductController());

  var _isInit=true;

  @override
  didChangeDependencies(){
    if(_isInit){
     setState((){
       productItemController.isDataLoading(true);
     });
     productItemController.fetchProducts().then((value) {
       setState((){
         productItemController.isDataLoading(false);
       });
     } );
    }
    _isInit=false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final productListItem=productItemController.items;
    return productListItem.isEmpty?
        Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("No products added yet",style: TextStyle(color: AppColors.hintTxtClr,fontSize: 20),),
          ],
        )
        :productItemController.isDataLoading.value ?
    const CircularProgressIndicator(
      color: AppColors.circularProgressClr,
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