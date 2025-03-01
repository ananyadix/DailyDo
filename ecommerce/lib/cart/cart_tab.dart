import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/cart/shipping.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/cart_controller.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Cart".text.white.make(),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body:StreamBuilder(
        stream: FirestoreService.getCart(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),),
            );
          }
          else if(snapshot.data!.docs.isEmpty){
            return Center(
                child: "Cart is Empty".text.color(Colors.grey).make()
            );
          }
          else{
            var data=snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot=data;
            return Column(
              children: [Expanded(child: ListView.builder(itemCount: data.length,itemBuilder: (BuildContext context,int index){
                return ListTile(
                  leading: Image.network("${data[index]['img']}"),
                  title: "${data[index]['title']}     X${data[index]['qty']}".text.size(16).make(),
                  subtitle: "${data[index]['price']} Rs".text.color(Colors.red).make(),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.red
                  ).onTap(() {
                    FirestoreService.deleteItem(data[index].id);
                  }),
                );
              })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total Price:".text.bold.size(20).black.make(),
                  Obx(() => "${controller.total.value} Rs".text.size(18).color(Colors.red).make())
                ],
              ).box.padding(EdgeInsets.all(10)).width(context.screenWidth).make(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ButtonReg(() {Get.to(()=>const ShippingScreen());}, Colors.yellow, Colors.white, "Proceed to Payment"),
                )],
            );
          }
        },
      )
    );
  }
}
