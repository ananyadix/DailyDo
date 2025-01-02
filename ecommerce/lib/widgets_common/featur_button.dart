import 'package:ecommerce/consts/consts.dart';

Widget FeatureButton(String? title,icon){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.color(Colors.grey).make()
    ],
  ).box.width(200).height(35).margin(const EdgeInsets.symmetric(horizontal: 4)).white.border(color: Colors.black).make();
}