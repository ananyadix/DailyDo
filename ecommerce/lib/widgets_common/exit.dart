import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/services.dart';

Widget ExitPop(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.size(18).color(Colors.black).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.size(15).color(Colors.black).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonReg((){
              SystemNavigator.pop();
            }, Colors.yellow, Colors.white, "Yes"),
            ButtonReg((){
              Navigator.pop(context);
            }, Colors.yellow, Colors.white, "No")
          ],
        )
      ],
    ).box.color(Colors.white).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}