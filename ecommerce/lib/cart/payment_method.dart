import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:ecommerce/views/home_screen/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart_controller.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Payment Method", style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 60,
        child: ButtonReg(
              () async{
            await controller.placeMyOrder(controller.paymentIndex.value,controller.total.value);
            await controller.clearCart();
            VxToast.show(context, msg: "Order Placed Successfully");
            Get.offAll(HomeScreen());
          },
          Colors.yellow,
          Colors.white,
          "Place my Order",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: List.generate(pay.length, (index) {
            return Obx(() => GestureDetector(
              onTap: () => controller.paymentIndex.value = index,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: controller.paymentIndex.value == index
                        ? Colors.yellowAccent
                        : Colors.transparent,
                    width: 6,
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      payImg[index],
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    if (controller.paymentIndex.value == index)
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          value: true,
                          onChanged: (_) {},
                        ),
                      ),
                  ],
                ),
              ),
            ));
          }),
        ),
      ),
    );
  }
}

