import 'package:ecommerce/consts/consts.dart';

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
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body:Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(itemCount: 3,autoPlay: true,height: 350,aspectRatio: 16/9, itemBuilder: (context,index){
                  return Image.asset("assets/images/silk.png",width: double.infinity,fit: BoxFit.fill,);
                }),
                10.heightBox,
                title!.text.size(25).color(Colors.black).make(),
                5.heightBox,
                "100 Rs".text.color(Colors.red).size(15).make(),
                5.heightBox,
                VxRating(onRatingUpdate: (value){},normalColor: Colors.grey,selectionColor: Colors.yellowAccent,count: 5,size: 25,stepInt: true,)
              ],
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ButtonReg((){}, Colors.yellow, Colors.white, "Add to Cart"),
          )
        ],
      ),
    );
  }
}
