import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';
import 'package:ecommerce/widgets_common/screen_button.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white70,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.black,
                  focusColor: Colors.yellowAccent,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search anything...",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            15.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          brands[index],
                          fit: BoxFit.fitWidth,
                        ),
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make(); // Complete the VelocityX chain
                    },
                  ),
                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      List.generate(2, (index) => HomeButton(context.screenWidth/2.5, context.screenHeight*0.15, index==0?hot:flash, index==0?"Hot Deals":"Flash Discount", (){}))
                      ,
                    ),
                    15.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: brands.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.asset(
                            brands2[index],
                            fit: BoxFit.fitWidth,
                            width: context.screenWidth-20,
                          ),
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make(); // Complete the VelocityX chain
                      },
                    ),
                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      List.generate(3, (index) => HomeButton(context.screenWidth/3.5, context.screenHeight*0.15, index==0?trending:index==1?frequent:favourite,
                          index==0?"Trending":index==1?"Frequently Bought":"Your Favourite", (){}))
                      ,
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: "Top Categories".text.color(Colors.black).size(18.0).make(),
                    ),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) => Column(
                        children: [
                          FeatureButton(top1[index],top1img[index]),
                          10.heightBox,
                          FeatureButton(top2[index], top2img[index])
                        ],
                      )
                      ).toList(),
                    ),
                  ),
                  15.heightBox,
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                        "assets/images/back.png"
                      ),
                      fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Top Daily Need Brands".text.black.size(18).make(),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children:
                                    List.generate(5, (index) => TopButton(context.screenWidth/3.5, context.screenHeight*0.2, index==0?haldiram:index==1?mcaffine:index==2?aqua:index==3?chemist:coffee,
                                        index==0?"Haldirams":index==1?"MCaffiene":index==2?"Aqualogica":index==3?"Chemist":"Bevzilla", (){}))
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
