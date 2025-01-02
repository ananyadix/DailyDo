import 'package:ecommerce/consts/consts.dart';

Widget TopButton(width,height,icon,String? title,onPress){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width:width-5 ,height: width-5,),
      10.heightBox,
      title!.text.color(Colors.black).align(TextAlign.center).make(),
      5.widthBox
    ],
  ).box.rounded.white.border(color: Colors.grey).size(width, height).make();
}