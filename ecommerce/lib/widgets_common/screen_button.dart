import 'package:ecommerce/consts/consts.dart';

Widget HomeButton(width,height,icon,String? title,onPress){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26,),
      10.heightBox,
      title!.text.color(Colors.grey).align(TextAlign.center).make(),
    ],
  ).box.rounded.white.border(color: Colors.grey).size(width, height).make();
}