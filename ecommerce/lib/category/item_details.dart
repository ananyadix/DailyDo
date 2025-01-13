import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  const ItemDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: title!.text.make(),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      itemCount: 3,
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          "assets/images/silk.png",
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                    10.heightBox,
                    title!.text.size(25).color(Colors.black).make(),
                    5.heightBox,
                    "100 Rs".text.color(Colors.red).size(15).make(),
                    5.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: Colors.grey,
                      selectionColor: Colors.yellowAccent,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "See more products by this"
                                  .text
                                  .color(Colors.black)
                                  .make()
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ).box.height(70).color(Colors.black12).padding(EdgeInsets.symmetric(horizontal: 16)).make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Flavours:".text.color(Colors.black).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                    (index) => VxBox()
                                    .size(40, 40)
                                    .color(Vx.randomColor)
                                    .roundedFull
                                    .margin(EdgeInsets.symmetric(horizontal: 5))
                                    .make(),
                              ),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity:".text.color(Colors.black).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove)),
                                "0".text.size(16).color(Colors.black).make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add))
                              ],
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total:".text.color(Colors.black).make(),
                            ),
                            "0 Rs".text.color(Colors.red).make()
                          ],
                        ).box.padding(EdgeInsets.all(8)).make()
                      ],
                    ),
                    10.heightBox,
                    "Description:".text.color(Colors.grey).make(),
                    "These chocolates offer versatility and can be paired with different foods to enhance their taste.".text.color(Colors.grey).make(),
                    10.heightBox,
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        detail.length,
                            (index) => ListTile(
                          title: detail[index].text.color(Colors.black).make(),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ButtonReg(() {}, Colors.yellow, Colors.white, "Add to Cart"),
          )
        ],
      ),
    );
  }
}

