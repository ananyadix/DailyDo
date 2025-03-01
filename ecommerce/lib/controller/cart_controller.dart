import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/home_controller.dart';
class CartController extends GetxController{
  var total=0.obs;
  var addressC=TextEditingController();
  var cityC=TextEditingController();
  var stateC=TextEditingController();
  var postalC=TextEditingController();
  var phoneC=TextEditingController();
  var paymentIndex=0.obs;
  var product=[];
  late dynamic productSnapshot;
  calculate(data){
    for(int i=0;i<data.length;i++){
      total.value=total.value+int.parse(data[i]['price'].toString());
    }
  }
  placeMyOrder(orderPaymentMethod, totalAmount) async{
    await getProductDetails();
    await firestore.collection(orderCollection).doc().set({
      'order_code':"123456789",
      'order_date':FieldValue.serverTimestamp(),
      'order_by':currentUser!.uid,
      'order_by_email':currentUser!.email,
      'order_by_address':addressC.text,
      'order_by_state':stateC.text,
      'order_by_city':cityC.text,
      'order_by_phone':phoneC.text,
      'order_by_pin':postalC.text,
      'shipping method':'Home Delivery',
      'payment_method':orderPaymentMethod,
      'order_placed':true,
      'total_amount':totalAmount,
      'orders':FieldValue.arrayUnion(product),
      'order_confirmed':false,
      'order_delivered':false,
      'order_on_delivery':false
    });
  }
  getProductDetails(){
    product.clear();
    for(var i=0;i<productSnapshot.length;i++){
      product.add({'img':productSnapshot[i]['img'],
      'qty':productSnapshot[i]['qty'],
        'title':productSnapshot[i]['title']
      });
    }
  }

  clearCart(){
    for(var i=0;i<productSnapshot.length;i++){
        firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}