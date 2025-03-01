import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';
import 'package:ecommerce/controller/poduct_controller.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetail({super.key, required this.title,this.data});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async{
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controller.resetValues();
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          backgroundColor: Colors.yellow,
          title: title!.text.make(),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            Obx(
                ()=> IconButton(onPressed: () {
                if(controller.isFavorite.value){
                  controller.removeFromWishlist(data.id,context);
                }else{
                  controller.addToWishlist(data.id,context);
                }
              }, icon:  Icon(Icons.favorite,color: controller.isFavorite.value ? Colors.red:Colors.white,)),
            )
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
                        itemCount: data['p_img'].length,
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_img'][index],
                            width: double.infinity,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                      10.heightBox,
                      title!.text.size(25).color(Colors.black).make(),
                      5.heightBox,
                      "${data['p_price']} Rs".text.color(Colors.red).size(15).make(),
                      5.heightBox,
                      VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rateing']),
                        onRatingUpdate: (value) {},
                        normalColor: Colors.grey,
                        selectionColor: Colors.yellowAccent,
                        count: 5,
                        size: 25,
                        maxRating: 5,
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
                                child: "Variants:".text.color(Colors.black).make(),
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
                              Obx(
                                  ()=> Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {controller.decQty();
                                          controller.totalCost(int.tryParse(data['p_price']));},
                                        icon: Icon(Icons.remove)),
                                    controller.quantity.value.text.size(16).color(Colors.black).make(),
                                    IconButton(
                                        onPressed: () {controller.incQty(int.tryParse(data['p_quantity']));
                                        controller.totalCost(int.parse(data['p_price']));}, icon: Icon(Icons.add)),
                                    "(${data['p_quantity']} available)".text.size(10).color(Colors.grey).make(),
                                  ],
                                ),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          Obx(
                            ()=> Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Total:".text.color(Colors.black).make(),
                                ),
                                "${controller.cost.value} Rs".text.color(Colors.red).make()
                              ],
                            ).box.padding(EdgeInsets.all(8)).make(),
                          )
                        ],
                      ),
                      10.heightBox,
                      "Description:".text.color(Colors.grey).make(),
                      "${data['p_desc']}".text.color(Colors.grey).make(),
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
              child: ButtonReg(() {
                if(controller.quantity.value>0){
                  controller.addToCart(data['p_name'],data['p_img'][0],controller.quantity.value,controller.cost.value,context);
                  VxToast.show(context, msg:"Successfully Added To Cart");
                }
                else{
                  VxToast.show(context, msg: "Nothing to add in cart");
                }
              }, Colors.yellow, Colors.white, "Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}

