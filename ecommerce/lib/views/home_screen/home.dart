import 'package:ecommerce/account/account_tab.dart';
import 'package:ecommerce/cart/cart_tab.dart';
import 'package:ecommerce/category/category_tab.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/views/home_screen/home_tab.dart';
import 'package:ecommerce/widgets_common/exit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var NavigationItem=[
      BottomNavigationBarItem(icon: Image.asset("assets/images/Vector.png", width: 26,height: 26,),label: "Home"),
      BottomNavigationBarItem(icon: Image.asset("assets/images/Vector (1).png",width: 26,height: 26,),label: "Categort"),
      BottomNavigationBarItem(icon: Image.asset("assets/images/Vector (2).png",width: 26,height: 26,),label: "Cart"),
      BottomNavigationBarItem(icon: Image.asset("assets/images/Vector (3).png",width: 26,height: 26,),label: "Account")
    ];
    var controller=Get.put(HomeController());
    var navBody=[
      HomeTab(),
      CategoryTab(),
      CartTab(),
      AccountTab()
    ];
    return WillPopScope(
      onWillPop: () async{
        showDialog(context: context, builder: (context)=>ExitPop(context),barrierDismissible: false);
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
            ()=> Expanded(
                child: navBody.elementAt(controller.currentNav.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          ()=> BottomNavigationBar(
            currentIndex: controller.currentNav.value,
            items: NavigationItem,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.yellowAccent,
            onTap: (value){
              controller.currentNav.value=value;
            },
          ),
        ),
      ),
    );
  }
}
