import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(account),fit: BoxFit.fill)
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Align(child: Icon(Icons.edit,color: Colors.black,),alignment: Alignment.topRight,),
                Row(
                  children: [
                    Image.asset("assets/images/profile.png",width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Ananya Dixit".text.color(Colors.black).make(),
                        "ananya.dixit1104@gmail.com".text.color(Colors.black).make(),
                      ],
                    )),
                    OutlinedButton(onPressed: (){}, child: "Log Out".text.color(Colors.black).make(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black
                      )
                    ),)
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailButton(width: context.screenWidth / 3.5, count: "0", title: "in your cart"),
                    detailButton(width: context.screenWidth / 3.5, count: "32", title: "bookmarked items"),
                    detailButton(width: context.screenWidth / 3.5, count: "7", title: "your orders")
                    ],
                ),
                40.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context,index){
                    return const Divider(color: Colors.grey,);
                  },
                  itemCount: accountMy.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      leading: Image.asset(accountImg[index],
                      width: 22,),
                      title: accountMy[index].text.color(Colors.black).make(),
                    );
                  },
                ).box.white.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).make()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
