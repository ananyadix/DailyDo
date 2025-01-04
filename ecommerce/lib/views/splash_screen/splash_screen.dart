import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/views/authentication_screen/login.dart';
import 'package:ecommerce/widgets_common/app_logo.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(Duration(seconds: 3),() {
      Get.to(()=>const LoginScreen());
    });
  }
  @override
  void initState(){
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child:Column(
            children: [
              350.heightBox,
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(logo,width: 300,)
              ),
              20.heightBox
            ],
          )
      ),

    );
  }
}
