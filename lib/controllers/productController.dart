
import 'package:get/get.dart';
import 'package:shopping_app/models/productModel.dart';

class ProductController extends GetxController{
  var isChecked=false.obs;

  final List<ProductModel> _items =[
    ProductModel(
      id: 'p1',
      title: 'Shirt',
      desc: 'Made of high quality breathable cotton, You boys not only look awesome in this t-shirts, they will cool and comfortable wearing it.A perfect gift for MaMa & MaMas Boy.',
      price: 29.99,
      quantity: 0.obs,
      imgUrl:
      'https://media.istockphoto.com/photos/blank-black-tshirt-front-with-clipping-path-picture-id483960103?b=1&k=20&m=483960103&s=170667a&w=0&h=hNKNseCmaThTsh4i7Q3kHETlWo5Zi7Ogw-luVozfP_M=',
    ),
    ProductModel(
      id: 'p2',
      title: 'Pent',
      desc:  'This blue hue cigarette pant with fabric detailing is chic and trendy.Style this exquisite pant with sophisticated outfits for this season. Fabric: Cambric.Color: Blue',
      price: 59.99,
      quantity: 0.obs,
      imgUrl:
      'https://media.istockphoto.com/photos/blue-chino-pants-with-brown-leather-belt-isolated-on-white-background-picture-id1149139165?k=20&m=1149139165&s=612x612&w=0&h=GZNt8WgiJ3tSbVmcAKbIUmFAzbulMTw1NJ7msG2Tyno=',
    ),
    ProductModel(
      id: 'p3',
      title: 'Scarf',
      desc:  'The most important consideration when choose a women scarf to wear around your neck or on your head, is whether it flatters your face.',
      price: 19.99,
      quantity: 0.obs,
      imgUrl:
      'https://media.istockphoto.com/photos/red-tartan-wool-winter-scarf-picture-id523136775?k=20&m=523136775&s=612x612&w=0&h=1X7ltTFmLNZ4v__rr8ecTNtklea9oDAWrP0hC8bPPxc=',
    ),
    ProductModel(
      id: 'p4',
      title: 'Pan',
      desc:  'More expensive pans are just made better. Handles do not jiggle, and if you drop them, they are far less likely to be damaged.',
      price: 49.99,
      quantity: 0.obs,
      imgUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ].obs;
  List<ProductModel> get items{
    return [..._items];
  }

  findItemById(String? id){
    return _items.firstWhere((element) => element.id==id);
  }
void addProduct(ProductModel product){
    final newProduct=ProductModel(
      id: DateTime.now().toString(),
      title: product.title,
      quantity: 0.obs,
      desc: product.desc,
      price: product.price,
      imgUrl:product.imgUrl );
    _items.add(newProduct);
}


}