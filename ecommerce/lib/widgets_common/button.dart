import 'package:ecommerce/consts/consts.dart';

Widget ButtonReg(onPress,color,textColor,String? title){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: (){onPress;},child: title!.text.color(textColor).make(),
  );
}