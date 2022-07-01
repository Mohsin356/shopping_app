
import 'package:flutter/material.dart';
import 'package:shopping_app/views/widgets/cartItemsList.dart';
import 'package:shopping_app/views/widgets/headingText.dart';
class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                    const HeadingText(txt: "My Cart",),
                    CartItemList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
