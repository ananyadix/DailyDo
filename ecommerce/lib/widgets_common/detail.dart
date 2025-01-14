import 'package:ecommerce/consts/consts.dart';

Widget detailButton({width,String? count,String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(Colors.black).make(),
      5.heightBox,
      title!.text.color(Colors.black).make()
    ],
  ).box.rounded.width(width).white.height(80).padding(EdgeInsets.all(4)).make();
}