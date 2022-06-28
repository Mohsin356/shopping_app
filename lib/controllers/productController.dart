
import 'package:get/get.dart';
import 'package:shopping_app/models/productModel.dart';

class ProductController extends GetxController{
  final List<ProductModel> _items =[
    ProductModel(
      id: 'p1',
      title: 'Shirt',
      desc: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgUrl:
      'https://media.istockphoto.com/photos/blank-black-tshirt-front-with-clipping-path-picture-id483960103?b=1&k=20&m=483960103&s=170667a&w=0&h=hNKNseCmaThTsh4i7Q3kHETlWo5Zi7Ogw-luVozfP_M=',
    ),
    ProductModel(
      id: 'p2',
      title: 'Pent',
      desc:  'A nice pair of trousers.',
      price: 59.99,
      imgUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModel(
      id: 'p3',
      title: 'Scarf',
      desc:  'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imgUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModel(
      id: 'p4',
      title: 'Pan',
      desc:  'Prepare any meal you want.',
      price: 49.99,
      imgUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ].obs;
  List<ProductModel> get items{
    return [..._items];
  }
}