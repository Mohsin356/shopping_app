
import 'package:flutter/material.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/views/widgets/appBarWidget.dart';
import 'package:shopping_app/views/widgets/appDrawer.dart';
import 'package:shopping_app/views/widgets/headingText.dart';
import 'package:shopping_app/views/widgets/productGrid.dart';
class ProductOverview extends StatefulWidget {
  ProductOverview({Key? key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  final productItemController= Get.put(ProductController());
  final cartController= Get.put(CartController());
  var _isInit=true;

  @override
  didChangeDependencies(){
    if(_isInit){
      productItemController.fetchProducts();
    }
    _isInit=false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWidget(titleTxt: 'Shop',titleSize: 26, iconFunction: cartController.myCart,
      ),
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBgClr,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      elevation: 6,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(Assets.bannerImgUrl,fit: BoxFit.contain,)),
                    ),
                  ),
                  const SizedBox(height: 15,),
                   const Padding(
                     padding: EdgeInsets.only(left: 8.0),
                     child: HeadingText(txt: "Products",),
                   ),
                  const SizedBox(height: 15,),
                  const ProductGrid(),
                ],
              ),
            ),
          ))
    );
  }
}

