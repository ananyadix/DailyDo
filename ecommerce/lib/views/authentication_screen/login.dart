import 'package:ecommerce/consts/list.dart';
import 'package:ecommerce/widgets_common/app_logo.dart';
import 'package:ecommerce/consts/consts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Back(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                AppLogo(),
                10.heightBox,
                Column(
                  children: [
                    CustomTextField(email,emailHint),
                    CustomTextField(password,passwordHind),
                    Align(
                        alignment:Alignment.centerRight,
                        child:TextButton(onPressed: (){}, child: forget.text.make()),
                    ),
                    8.heightBox,
                    ButtonReg((){},Colors.yellowAccent,Colors.white,login).box.width(context.screenWidth-50).make(),
                    8.heightBox,
                    createNew.text.make(),
                    8.heightBox,
                    ButtonReg((){Get.to(()=>const Signup());}, Colors.white54, Colors.black, signup).box.width(context.screenWidth-50).make(),
                    12.heightBox,
                    loginWith.text.make(),
                    8.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => Padding(padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 25,
                        child: Image.asset(social[index],
                        width: 30,),
                      ),)),
                    )
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make()
              ],
            ),
          ),
        )
    );
  }
}
