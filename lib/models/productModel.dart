

import 'package:get/get.dart';
class ProductModel{
  final String? id;
  final String? title;
  final String? desc;
  final double? price;
  final String? imgUrl;
  bool? isFav;

  ProductModel({ required this.id, this.title, this.desc, this.price, this.imgUrl,this.isFav});

}

