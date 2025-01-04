import 'package:ecommerce/category/category_detail.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Categories".text.white.make(),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200 ,),itemCount: categoryImages.length, itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset(categoryImages[index],
              height: 130,
              width: 200,
              fit: BoxFit.fill,),
              10.heightBox,
              categoris[index].text.color(Colors.grey).align(TextAlign.center).make()
            ],
          ).box.rounded.color(Colors.black12).clip(Clip.antiAlias).make().onTap(() {
            Get.to(()=>CategoryDetail(title: categoris[index]));
          });
        }),
      ),
    );
  }
}
