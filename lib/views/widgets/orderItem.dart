
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key,this.title,this.date}) : super(key: key);
  final double? title;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('$title'),
            subtitle: Text(date!),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more), onPressed: () {  },
            ),
          )
        ],
      ),
    );
  }
}
