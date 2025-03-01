import 'package:ecommerce/consts/consts.dart';

Widget orderPlaceDetail(title1,title2,d1,d2){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title1".text.bold.make(),
              "$d1".text.color(Colors.grey).make(),
            ],
          ),
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "$title2".text.bold.make(),
                "$d2".text.color(Colors.grey).make(),
              ],
            ),
          )
        ]
    ),
  );
}