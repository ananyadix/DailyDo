import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:ecommerce/widgets_common/app_logo.dart';
import 'package:ecommerce/views/authentication_screen/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? isCheck=false;
  var controller=Get.put(AuthController());
  var nameC=TextEditingController();
  var emailC=TextEditingController();
  var passwordC=TextEditingController();
  var passwordRetryC=TextEditingController();
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
                    CustomTextField(name,nameHint,nameC,false),
                    CustomTextField(email,emailHint,emailC,false),
                    CustomTextField(password, passwordHind,passwordC,true),
                    CustomTextField(retry, passwordHind,passwordRetryC,true),
                    5.heightBox,
                    Row(
                      children: [
                        Checkbox(value: isCheck, onChanged: (newValue){setState(() {
                          isCheck=newValue;
                        });},checkColor: Colors.yellowAccent,),
                        10.widthBox,
                        Expanded(child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "I agree to all the ",
                                style: TextStyle(
                                    color: Colors.black54
                                )
                            ),
                            TextSpan(
                                text: terms,
                                style: TextStyle(
                                    color: Colors.yellowAccent
                                )
                            ),
                            TextSpan(
                                text: " & ",
                                style: TextStyle(
                                    color: Colors.black54
                                )
                            ),
                            TextSpan(
                                text: policy,
                                style: TextStyle(
                                    color: Colors.yellowAccent
                                )
                            )
                          ]),
                        ))
                      ],
                    ),
                    8.heightBox,
                    ButtonReg(() async{
                      if(isCheck!=false){
                        try{
                          await controller.signupMethod(email: emailC.text,password: passwordC.text,context: context).then((value){
                            return controller.storeUserData(uname: nameC.text,uemail: emailC.text,upassword: passwordC.text);
                          }).then((value){
                            VxToast.show(context, msg: "Successfully Signed in");
                            Get.offAll(()=>HomeScreen());
                          });
                        }catch(e){
                          auth.signOut();
                          VxToast.show(context, msg:e.toString());
                        }
                      }
                    },isCheck==true? Colors.yellowAccent: Colors.grey,Colors.white,signup).box.width(context.screenWidth-50).make(),
                    8.heightBox,
                    RichText(text: const TextSpan(
                        children: [
                          TextSpan(
                              text: already,
                              style: TextStyle(
                                  color: Colors.black54
                              )
                          ),
                          TextSpan(
                              text: " Login",
                              style: TextStyle(
                                  color: Colors.yellowAccent
                              )
                          )
                        ]
                    )
                    ).onTap(() {Get.to(()=>LoginScreen());})
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
              ],
            ),
          ),
        )
    );
  }
}
