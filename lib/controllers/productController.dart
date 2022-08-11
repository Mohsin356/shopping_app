
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/models/http_exception.dart';
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
    }
    catch(err){
      throw err;
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
      throw error;
    }
}

Future<void> updateProduct(String id,ProductModel updatedProduct)async{
    final productIndex=_items.indexWhere((element) => element.id==id);
    if(productIndex>=0){
      final url='https://shop-auth-33de3-default-rtdb.firebaseio.com/products/$id.json';
      await http.patch(Uri.parse(url),body: json.encode({
        'id':updatedProduct.id,
        'title':updatedProduct.title,
        'desc':updatedProduct.desc,
        'price':updatedProduct.price,
        'imgUrl':updatedProduct.imgUrl
      }));
      _items[productIndex]=updatedProduct;
    }
}
  Future<void> deleteProduct(String id) async {
    final url = 'https://flutter-update.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    ProductModel? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}

