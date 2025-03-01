import 'package:ecommerce/cart/payment_method.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/cart_controller.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: "Shipping Information".text.white.make(),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 60,
        child: ButtonReg(() {Get.to(()=> const PaymentMethod());}, Colors.yellow, Colors.white, "Continue"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            CustomTextField("Address", "Address", controller.addressC, false),
            CustomTextField("City", "City", controller.cityC, false),
            CustomTextField("State", "State", controller.stateC, false),
            CustomTextField("Pin Code","Pin Code", controller.postalC, false),
            CustomTextField("Contact Number", "Contact Number", controller.phoneC, false)
          ],
        ),
      ),
    );
  }
}
