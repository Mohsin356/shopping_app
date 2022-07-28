
import 'package:get/get.dart';

class ProductModel{
  final String? id;
  final String? title;
  final String? desc;
  final double? price;
  final String? imgUrl;
  RxInt? quantity=0.obs;


  ProductModel({ required this.id, this.title, this.desc, this.price, this.imgUrl,this.quantity});

}

