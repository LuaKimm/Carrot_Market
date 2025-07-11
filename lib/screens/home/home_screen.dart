import 'package:carrot_market/models/product.dart';
import 'package:carrot_market/screens/home/components/product_item.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('좌동'),
            const SizedBox(width: 4.0),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 15.0,
            )
          ],
        ),
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(CupertinoIcons.list_dash), onPressed: (){}),
          IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: (){}
    ),
    ],
    bottom: const PreferredSize(
    preferredSize: Size.fromHeight(0.5),
    child: Divider(thickness: 0.5,height: 0.5, color: Colors.grey),
    ),
    ),
    body: ListView.separated(
    separatorBuilder: (context, index) => const Divider(
    height: 0,
    indent: 16,
    endIndent: 16,
    color: Colors.grey,
    ),
    itemBuilder: (context, index){
      return ProductItem(product: productList[index],
    );
    },
    itemCount: productList.length,
    ),
    );
  }
}
