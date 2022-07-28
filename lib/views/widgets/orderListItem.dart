
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/orderModel.dart';
import 'package:shopping_app/utils/colors.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Card(
              elevation: 2,
              child: ExpansionTile(title: Text('Rs ${order.amount!.toStringAsFixed(2)}',
              ),
                subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime!),
                  style: const TextStyle(color: AppColors.hintTxtClr,fontSize: 12),),
                children: order.products!.map((e) =>
                    Padding(padding: const EdgeInsets.all(10),
                      child:  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.title!),
                          Text('${e.quantity} x ${e.price}')
                        ],
                      ),))
                ).toList(),
              ),
            ),
          );
  }
}
