// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firstui_project/HomePage/models/product_model.dart';
import 'package:flutter/material.dart';

import 'productDesign.dart';

class Grid extends StatelessWidget {
  int count;
  List<ProductModel> list;
  bool physics;
  Grid(this.count, this.list, this.physics, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
      padding: physics ? EdgeInsets.all(15) : EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 15,
        mainAxisExtent: 300,
      ),
      itemCount: count

      // allSelect
      //     ? products.length
      //     : products.where((element) => element.category == cateSelect).length
      ,
      itemBuilder: (context, index) {
        return ProductDesign(list[index]
            // allSelect
            //   ? products[index]
            //   : products
            //       .where((element) => element.category == cateSelect)
            //       .toList()[index]
            );
      },
    );
  }
}
