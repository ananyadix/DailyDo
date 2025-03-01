import 'package:ecommerce/orders_screen/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders", style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body:StreamBuilder(
        stream: FirestoreService.getOrders(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.yellow),),
            );
          }
          else if(snapshot.data!.docs.isEmpty){
            return "No order placed yet!".text.color(Colors.grey).make();
          }
          else{
            var data=snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: data[index]['order_code'].toString().text.color(Colors.red).make(),
                    leading: "${index+1}".text.black.bold.make(),
                    subtitle: data[index]['total_amount'].toString().text.black.make(),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black
                      ),
                      onPressed: (){
                        Get.to(()=>OrderDetail(data: data[index],));
                      },
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
