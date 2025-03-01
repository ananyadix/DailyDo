import 'package:ecommerce/consts/consts.dart';

Widget orderStatus(icon,color,title,showDone){
  return ListTile(
    leading: Icon(
      icon,color: color,
    ).box.roundedSM.padding(EdgeInsets.all(5)).border(color: color).make(),
    trailing: SizedBox(
      height: 100,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "$title".text.bold.make(),
          showDone? const Icon(Icons.done_all,color: Colors.green,):Container()
        ],
      ),
    ),
  );
}