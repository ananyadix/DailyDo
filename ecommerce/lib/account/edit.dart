import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/profile_controller.dart';

class EditScreen extends StatelessWidget {
  final dynamic data;

  const EditScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(account), fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image
                    .asset(
                  "assets/images/profile.png", width: 100, fit: BoxFit.cover,)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),
                10.heightBox,
                Text("Edit Profile"),
                const Divider(),
                20.heightBox,
                CustomTextField("Name", "Ananya Dixit", controller.nameC, false),
                5.heightBox,
                CustomTextField("Current Password", "*******", controller.oldPassC, true),
                5.heightBox,
                CustomTextField("New Password", "*******", controller.passC, true),
                20.heightBox,
                controller.isLoading.value ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),) :
                SizedBox(width: context.screenWidth - 60,
                    child: ButtonReg(() async {
                      controller.isLoading(true);
                      if(data['password']==controller.oldPassC.text){
                        controller.changeAuthPassword(data['email'], controller.oldPassC.text, controller.passC.text);
                        await controller.updateProfile(
                            controller.nameC.text, controller.passC.text);
                        VxToast.show(context, msg: "Profile Updated");
                      }
                      else{
                        VxToast.show(context, msg: "Password is wrong!");
                        controller.isLoading(false);
                      }
                    }, Colors.yellow, Colors.white, "Save Changes")),
              ],
            ).box.shadowSm
                .padding(EdgeInsets.all(16))
                .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                .color(Colors.white)
                .rounded
                .make(),
          ),
        ),
      ),);
  }
}