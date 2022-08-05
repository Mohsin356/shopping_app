

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/productController.dart';
import 'package:shopping_app/models/productModel.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/widgets/inputFormField.dart';

class EditProduct extends StatefulWidget {
   const EditProduct({Key? key}) : super(key: key);


  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final productController=Get.find<ProductController>();
  final _priceFocusNode=FocusNode();
  final _detailFocusNode=FocusNode();
  final _imageUrlFocusNode=FocusNode();
  final _imageUrlController= TextEditingController();
  final _formKey =GlobalKey<FormState>();
  var _editedProduct= ProductModel(id: null,title: '',price: 0.0,desc: '',imgUrl: '');
  var _isInit=true;
  var _initValues={
    'title':'',
    'description':'',
    'price':'',
    'imageUrl':'',
  };
  var _isLoading=false;
  @override
  initState(){
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
}
  @override
  didChangeDependencies(){
    if(_isInit){
      final productId= Get.arguments;
      if(productId != null){
        _editedProduct=productController.findItemById(productId);
        _initValues={
          'title':_editedProduct.title!,
          'description':_editedProduct.desc!,
          'price':_editedProduct.price.toString(),
          'imageUrl':'',
        };
        _imageUrlController.text=_editedProduct.imgUrl!;
      }
    }
    _isInit=false;
    super.didChangeDependencies();
}
  @override
  void dispose(){
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _detailFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }
  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }
  void _saveForm(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return ;
    }
    _formKey.currentState!.save();
    setState((){
      _isLoading=true;
    });
    if(_editedProduct.id!=null){
      productController.updateProduct(_editedProduct.id!, _editedProduct);
      setState((){
        _isLoading=false;
      });
      Navigator.pop(context);
    }
    else{
      productController.addProduct(_editedProduct).then((_)
      {
        setState((){
          _isLoading=false;
        });
        Navigator.pop(context);} );
    }
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
        actions: [
          IconButton(onPressed: _saveForm, icon: const Icon(Icons.save,color: AppColors.iconClr,)),
        ],
      ),
      body: _isLoading?
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.circularProgressClr,
            ),
          )
          :Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InputFormField(
                initVal: _initValues['title'],
                labelTxt: 'Title',
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
                function: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                  return null;
                },
                validator: (value){
                if(value!.isEmpty){
                  return"Title can not be empty.";
                }
                return null;
                },
                functionSaveForm:(value){
                _editedProduct=ProductModel(id: _editedProduct.id,
                title: value,
                price: _editedProduct.price,
                desc: _editedProduct.desc,
                imgUrl: _editedProduct.imgUrl,
                quantity: 0.obs);
                },
              ),
              InputFormField(
                initVal: _initValues['price'],
                labelTxt: 'Price',
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                focusNode: _priceFocusNode,
                function: (_){
                  FocusScope.of(context).requestFocus(_detailFocusNode);
                  return null;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return"Price can not be empty.";
                  }
                  if(double.tryParse(value)==null){
                    return'Please enter correct price';
                  }
                  if(double.parse(value)<=0){
                    return 'Price can not be zero.';
                  }
                  return null;
                },
                functionSaveForm:(value){
                  _editedProduct=ProductModel(id: _editedProduct.id,
                      title: _editedProduct.title,
                      price: double.parse(value!),
                      desc: _editedProduct.desc,
                      imgUrl: _editedProduct.imgUrl,
                      quantity: 0.obs);
                },
              ),
              InputFormField(
                initVal: _initValues['description'],
                labelTxt: "Description",
                maxLines: 3,
                focusNode: _detailFocusNode,
                inputType: TextInputType.multiline,
                validator: (value){
                  if(value!.isEmpty){
                    return"Description can not be empty.";
                  }
                  if(value.length<10){
                    return "Description must be at least 10 characters long.";
                  }
                  return null;
                },
                functionSaveForm:(value){
                  _editedProduct=ProductModel(id: _editedProduct.id,
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      desc: value,
                      imgUrl: _editedProduct.imgUrl,
                      quantity: 0.obs);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin:const  EdgeInsets.only(top: 10,right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: AppColors.imgBorderUnFocused),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _imageUrlController.text.isEmpty?
                    const Center(child:  Text("Enter a URL"),):FittedBox(

                      child: Image.network(_imageUrlController.text,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                      child: InputFormField(
                        labelTxt: "Image URL",
                        inputType: TextInputType.url,
                        inputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        function: (_){
                          _saveForm();
                          return null;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return"Image URL can not be empty.";
                          }
                          return null;
                        },
                        functionSaveForm:(value){
                          _editedProduct=ProductModel(id: _editedProduct.id,
                              title: _editedProduct.title,
                              price: _editedProduct.price,
                              desc: _editedProduct.desc,
                              imgUrl: value,
                              quantity: 0.obs);
                        },
                      ))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
