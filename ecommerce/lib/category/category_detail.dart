import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/category/item_details.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/poduct_controller.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: title!.text.white.make(),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body:StreamBuilder(
        stream: FirestoreService.getProduct(title),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),),
            );
          }
          else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: "Currently No Product Available".text.color(Colors.grey).make(),
            );
          }
          else{
            var data=snapshot.data!.docs;
            return Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.subCategory.length, (index) => "${controller.subCategory[index]}".text.size(15).color(Colors.grey).makeCentered().box.white.rounded.border(color: Colors.yellowAccent).margin(const EdgeInsets.symmetric(horizontal: 4)).size(150, 50).make()),
                    ),
                  ),
                  20.heightBox,
                  Expanded(child: Container(
                    child: GridView.builder(physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisExtent: 250,mainAxisSpacing: 8),itemCount: data.length, itemBuilder: (context,index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.heightBox,
                              Image.network(data[index]['p_img'][0],
                                height: 140,
                                width: 200,
                                fit: BoxFit.contain,),
                              10.heightBox,
                              "${data[index]['p_name']}".text.size(20).color(Colors.black).make(),
                              5.heightBox,
                              "${data[index]['p_price']} Rs".text.color(Colors.red).size(12).make()
                            ],
                          ).box.rounded.white.border(color: Colors.black).clip(Clip.antiAlias).padding(EdgeInsets.all(5)).make().onTap(() {
                            controller.checkIfFavourite(data[index]);
                            Get.to( ItemDetail(title:"${data[index]['p_name']}" ,data: data[index],));});
                        }),
                  ))
                ],
              ),
            );
          }
        },
      )
    );
  }
}
