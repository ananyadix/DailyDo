import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title!.text.white.make(),
        backgroundColor: Colors.yellowAccent,
      ),
      backgroundColor: Colors.white,

    );
  }
}
