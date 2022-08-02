
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/inputFormField.dart';

class EditProduct extends StatefulWidget {
   const EditProduct({Key? key}) : super(key: key);


  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocusNode=FocusNode();
  final _detailFocusNode=FocusNode();

  @override
  void dispose(){
    _priceFocusNode.dispose();
    _detailFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0,
        title: const Text('Edit Product',style: TextStyle(color: AppColors.appBarTxtClr,fontSize: 22,fontWeight: FontWeight.w600),),
        backgroundColor: AppColors.appBarBgClr,
        iconTheme: const IconThemeData(
          color: AppColors.appBarIconClr,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        // actions: [
        //   IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: AppColors.iconClr,)),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: [
              InputFormField(labelTxt: 'Title',
              inputAction: TextInputAction.next,
                function: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                  return null;
                },
              ),
              InputFormField(
                labelTxt: 'Price',
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                focusNode: _priceFocusNode,
                function: (_){
                  FocusScope.of(context).requestFocus(_detailFocusNode);
                  return null;
                },
              ),
              InputFormField(
                labelTxt: "Description",
                maxLines: 3,
                focusNode: _detailFocusNode,
                inputType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
