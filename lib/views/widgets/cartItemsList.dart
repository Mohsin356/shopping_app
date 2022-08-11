
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/orderController.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/views/screens/ordersScreen.dart';
import 'package:shopping_app/views/widgets/dialogueWidget.dart';

class CartItemList extends StatelessWidget {
  CartItemList({Key? key,}) : super(key: key);
  final cartItemController = Get.find<CartController>();
  final orderController= Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => cartItemController.cartItems.isEmpty ?
    Column(
      children: const[
        SizedBox(height: 40,),
        Center(
          child:  Text("No Items Added Yet!",style: TextStyle(fontSize: 20,color: AppColors.hintTxtClr)),
        )
      ],
    ) :
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: cartItemController.cartItems.length,
              itemBuilder: (context,index){
                return ListTile(
                    leading: Text("${cartItemController.cartItems.values.toList()[index].title}",style: const TextStyle(fontSize: 18),),
                    title:  Center(
                      child: Obx(() => Text("${cartItemController.cartItems.values.toList()[index].quantity!}"
                          " x Rs ${(cartItemController.cartItems.values.toList()[index].quantity!*cartItemController.cartItems.values.toList()[index].price!).toStringAsFixed(2)}"),),
                    ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 0.0),
                    child: IconButton(onPressed: (){
                      showDialog(context: context, builder: (context)=>DialogueWidget(
                        titleTxt: "Are you Sure?",
                        contentTxt: "Are you sure to remove ${cartItemController.cartItems.values.toList()[index].title} from cart?",
                        confirmed: (){
                          cartItemController.removeItem(cartItemController.cartItems.keys.toList()[index]);
                          Navigator.pop(context);
                        },
                        notConfirmed: (){
                          Navigator.pop(context);
                        },
                      ));
                    },icon: const Icon(Icons.delete,color: AppColors.iconClr,),),
                  ),
                );
              }),
          const SizedBox(height: 15,),
           Text("Total: ${cartItemController.totalPrice.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 15,),
          OrderButton(cartItemController: cartItemController, orderController: orderController),
        ],
      ),

    ));
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cartItemController,
    required this.orderController,
  }) : super(key: key);

  final CartController cartItemController;
  final OrderController orderController;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary:AppColors.btnClr,onPrimary: AppColors.btnTxtClr,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed:(widget.cartItemController.totalPrice==0.0 || _isLoading)?null:
          ()async{
        setState((){
          _isLoading=true;
        });
        await widget.orderController.addOrder(widget.cartItemController.cartItems.values.toList(),
            widget.cartItemController.totalPrice.toStringAsFixed(2));
        setState((){
          _isLoading=false;
        });
        widget.cartItemController.clearItems();
        Get.to(()=>OrdersScreen());
      },
      child: _isLoading? const CircularProgressIndicator(color: AppColors.circularProgressClr,):
      const  Text("Place Order"),));
  }
}