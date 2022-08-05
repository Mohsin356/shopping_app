
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/utils/urls.dart';

class ProductController extends GetxController{
  var isChecked=false.obs;
  var isDataLoading = false.obs;
  final  _items =<ProductModel>[].obs;
  List<ProductModel> get items{
    return [..._items];
  }

  findItemById(String? id){
    return _items.firstWhere((element) => element.id==id);
  }
Future<void>fetchProducts()async{
    try{
      isDataLoading(true);
      final response =await http.get(Uri.parse(Url.productUrl));
      if(response.statusCode==200){
        final extractedData=json.decode(response.body) as Map<String,dynamic>;
        final loadedList=<ProductModel>[];
        extractedData.forEach((productId, productData) {
          loadedList.add(ProductModel(
            id: productId,
            quantity: 0.obs,
            title: productData['title'],
            desc: productData['desc'],
            price: productData['price'].toDouble(),
            imgUrl: productData['imgUrl'],
          ));
        });
        _items.value=loadedList;
      }
      else{
        print("No data");
      }
    }
    catch(err){
      throw err;
    }
    finally{
      isDataLoading(false);
    }
}

Future<void> addProduct(ProductModel product)async{
    try{
      final response = await http.post(Uri.parse(Url.productUrl),body: json.encode({
        'id':product.id,
        'title':product.title,
        'desc':product.desc,
        'price':product.price,
        'imgUrl':product.imgUrl
      }));
      final newProduct=ProductModel(
          id: json.decode(response.body)['name'],
          title: product.title,
          quantity: 0.obs,
          desc: product.desc,
          price: product.price,
          imgUrl:product.imgUrl );
      _items.add(newProduct);
    }
    catch(error){
      print(error);
    }
}

void updateProduct(String id,ProductModel updatedProduct){
    final productIndex=_items.indexWhere((element) => element.id==id);
    if(productIndex>=0){
      _items[productIndex]=updatedProduct;
    }
    else{
      print('No product');
    }
}
deleteProduct(String id){
    _items.removeWhere((element) =>element.id==id);
}

}