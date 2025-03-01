import 'package:ecommerce/account/edit.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/orders_screen/order_screen.dart';
import 'package:ecommerce/views/authentication_screen/login.dart';
import 'package:ecommerce/controller/profile_controller.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ProfileController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(account), fit: BoxFit.fill),
      ),
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreService.getUser(currentUser?.uid ?? ""), // Ensure currentUser is not null
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),
                ),
              );
            }

            // Handle errors
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            // Check if data exists and is not empty
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "No user data found",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }

            var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.edit, color: Colors.black).onTap(() {
                        controller.nameC.text=data['name'];
                        Get.to(() => EditScreen(data: data,));
                      }),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/profile.png",
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}".text.color(Colors.black).make(),
                              "${data['email']}".text.color(Colors.black).make(),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            await Get.put(AuthController());
                            Get.offAll(() => const LoginScreen());
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.black),
                          ),
                          child: "Log Out".text.color(Colors.black).make(),
                        ),
                      ],
                    ),
                    20.heightBox,
                    FutureBuilder(
                    future:FirestoreService.getCount(),
                    builder: (BuildContext context,AsyncSnapshot snapshot){
                      if(!snapshot.hasData){
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.yellow),
                          ),
                        );
                      }
                      else{
                        var countData=snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailButton(
                                width: context.screenWidth / 3.5,
                                count: countData[0].toString() ,
                                title: "in your cart"),
                            detailButton(
                                width: context.screenWidth / 3.5,
                                count: countData[1].toString() ,
                                title: "in wishlist"),
                            detailButton(
                                width: context.screenWidth / 3.5,
                                count: countData[2].toString() ,
                                title: "your orders"),
                          ],
                        );
                      }
                    }),
                    40.heightBox,
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.grey);
                      },
                      itemCount: accountMy.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: (){
                            if(index==0){
                              Get.to(()=>OrderScreen());
                            }
                          },
                          leading: Image.asset(
                            accountImg[index],
                            width: 22,
                          ),
                          title: accountMy[index].text.color(Colors.black).make(),
                        );
                      },
                    ).box.white.rounded.padding(
                      const EdgeInsets.symmetric(horizontal: 16),
                    ).make(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

