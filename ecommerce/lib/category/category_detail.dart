import 'package:ecommerce/category/item_details.dart';
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
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) => "Chocolates".text.size(15).color(Colors.grey).makeCentered().box.white.rounded.border(color: Colors.yellowAccent).margin(const EdgeInsets.symmetric(horizontal: 4)).size(150, 50).make()),
              ),
            ),
            20.heightBox,
            Expanded(child: Container(
              child: GridView.builder(physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisExtent: 250,mainAxisSpacing: 8),itemCount: 6, itemBuilder: (context,index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.heightBox,
                    Image.asset("assets/images/silk.png",
                    height: 150,
                    width: 200,
                    fit: BoxFit.contain,),
                    10.heightBox,
                    "Dairy Milk Silk Moose".text.size(20).color(Colors.black).make(),
                    5.heightBox,
                    "100 Rs".text.color(Colors.red).size(12).make()
                  ],
                ).box.rounded.white.border(color: Colors.black).clip(Clip.antiAlias).make().onTap(() {Get.to(const ItemDetail(title: "Dairy Milk"));});
              }),
            ))
          ],
        ),
      ),
    );
  }
}
